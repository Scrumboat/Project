class Invoice < ActiveRecord::Base
  versioned :dependent => :tracking
  belongs_to :member, :foreign_key => 'member_id'
  attr_accessible :ensirekisterimaksu, :jasenmaksu, :jno, :katsastussakko, :laiturimaksu, :laskutuslisa, :liittymismaksu, :muutMaksut, :nimi, :suoritukset_kassaan, :talkookerroin, :talkoosakko, :telakkamaksu, :toimihlokerroin, :varastokoppimaksu, :vartiosakko, :venerekisterimaksu, :viitesuoritukset, :luontipvm, :lahetyspvm, :tunniste, :maksettu, :erapvm, :member_id, :summa, :viitenumero, :karhuttu, :vapaasana
  accepts_nested_attributes_for :member
  has_many :payments

  def self.search(search)
    if search == "paid"
      where('"maksettu" = ?', true)
    elsif search == "unpaid"
      where('"maksettu"  = ?', false)
    elsif search == "overdue"
      where('"maksettu" = ? AND erapvm < ?', false, Time.now.to_date)
    else
      find(:all)
    end
  end

  def eraantynyt()
    if self.erapvm < DateTime.now.to_date
      return true
    else
      return false
    end
  end

  def self.karhu()
    @jasenet = Member.all
    for jasen in @jasenet
      for invoice in jasen.invoices
        if invoice.eraantynyt() && !invoice.maksettu
          if invoice.karhuttu != nil
            invoice.karhuttu += Pricing.find_by_target("karhumaksu").data
          else
            invoice.karhuttu = Pricing.find_by_target("karhumaksu").data
          end
          if invoice.summa != nil
            invoice.summa += Pricing.find_by_target("karhumaksu").data
          else
            invoice.summa = Pricing.find_by_target("karhumaksu").data
          end
          invoice.save
        end
      end
    end
  end

  def self.laskuta(haluttumaara)
    yhdistettavat = []
    @jasenet = Member.all
    for jasen in @jasenet
      if jasen.email_fax != nil
        for invoice in jasen.invoices
          if !invoice.maksettu
            InvoiceMailer.lasku(jasen, invoice).deliver
            invoice.lahetetty = true
            invoice.lahetystapa = "Email"
            invoice.save
          end
        end
      else
        for invoice in jasen.invoices
          if !invoice.maksettu
            #pdf = InvoicePdf.new(invoice)
            yhdistettavat.push invoice
            invoice.lahetetty = true
            invoice.lahetystapa = "posti"
            invoice.save
          end
        end
      end
    end
    counter = 0
    filuja = 0
    haluttumaaraperpdf = haluttumaara
    pdf = Prawn::Document.new
    for lasku in yhdistettavat
      if filuja%haluttumaaraperpdf == 0 && filuja != 0
        pdf.render_file counter.to_s+".pdf"
        pdf = Prawn::Document.new
        counter += 1
      end
      @invoice = lasku
      @member = Member.find_by_jno(@invoice.jno)
      pdf.text "Lasku #{@invoice.tunniste}"
      pdf.move_down 10
      pdf.text "nimi:  #{@invoice.nimi}"
      pdf.move_down 10
      pdf.text "Jasennumero:  #{@invoice.jno}"
      pdf.move_down 10
      pdf.text "osoite:  #{@member.osoite}"
      pdf.move_down 10
      pdf.text "posti:  #{@member.posti}"
      pdf.move_down 10
      pdf.text "Email:  #{@member.email_fax}"
      pdf.move_down 10
      pdf.text "katsastussakko:  #{@invoice.katsastussakko}"
      pdf.move_down 10
      pdf.text "Laiturimaksu:  #{@invoice.laiturimaksu}"
      pdf.move_down 10
      pdf.text "Liittymismaksu:  #{@invoice.liittymismaksu}"
      pdf.move_down 10
      pdf.text "Muut maksut:  #{@invoice.muutMaksut}"
      pdf.move_down 10
      pdf.text "Talkoosakko:  #{@invoice.talkoosakko}"
      pdf.move_down 10
      pdf.text "telakkamaksu:  #{@invoice.telakkamaksu}"
      pdf.move_down 10
      pdf.text "varastokoppimaksu:  #{@invoice.varastokoppimaksu}"
      pdf.move_down 10
      pdf.text "Vartiosakko:  #{@invoice.vartiosakko}"
      pdf.move_down 10
      pdf.text "Venerekisterimaksu:  #{@invoice.venerekisterimaksu}"
      pdf.move_down 10
      pdf.text "Viivastysmaksu:  #{@invoice.karhuttu}"
      pdf.move_down 10
      pdf.text "Lisatietoja:  #{@invoice.vapaasana}"
      pdf.move_down 10
      pdf.text "Summa:  #{@invoice.summa}"
      pdf.move_down 10
      pdf.text "Viitenumero:  #{@member.viitenumero}"
      pdf.move_down 10
      pdf.text "Lahetyspvm:  #{@invoice.lahetyspvm}"
      pdf.move_down 10
      pdf.text "Erapvm:  #{@invoice.erapvm}"
      pdf.move_down 10
      filuja += 1
      if filuja%haluttumaaraperpdf != 0 && filuja < yhdistettavat.length
        pdf.start_new_page
      end
      if filuja == yhdistettavat.length
        pdf.render_file counter.to_s+".pdf"
      end
    end
  end

  def self.createInvoices(tunniste)
    @jasenet = Member.all
    for jasen in @jasenet
      vanha_lasku = Invoice.where(:tunniste => tunniste, :member_id => jasen.id)
      if !vanha_lasku.empty?
        return
      end
      summa = 0.0
      nimi = jasen.nimi
      jno = jasen.jno
      liittymismaksu = 0
      if jasen.liittynyt > (Date.today - 6.months)
        #Liittymismaksu jäsentyypin perusteella
        if jasen.jasentyyppi == "aikuisjasen"
          liittymismaksu = Pricing.find_by_target("liittymismaksuAikuinen").data
        else
          liittymismaksu = 0
        end
        liittymismaksu += Pricing.find_by_target("ensirekmaksu").data
      end
      # Jäsenmaksu jäsentyypin mukaan
      if jasen.jasentyyppi == "aikuisjasen"
        jasenmaksu = Pricing.find_by_target("jasenmaksuAikuinen").data
      elsif jasen.jasentyyppi == "puolisojasen"
        jasenmaksu = Pricing.find_by_target("jasenmaksuPerhe").data
      elsif jasen.jasentyyppi == "nuorisojasen"
        jasenmaksu = Pricing.find_by_target("jasenmaksuNuoriso").data
      elsif jasen.jasentyyppi == "ainaisjasen"
        jasenmaksu = Pricing.find_by_target("jasenmaksuAinais").data
      end
      #jasenmaksu = Pricing.find_by_target("jasenmaksu").data
      varastomaksu = 0
      if !jasen.varasto.blank?
        #varastomaksu = (Pricing.find_by_target("varastokoppinelio").data)*(Storage.find_by_vk(jasen.varasto).pala)
        varastomaksu = Pricing.find_by_target("varastokoppivuosi").data
      end
      #laiturimaksu = Pricing.find_by_target("minLaituripaikanHinta").data
      laiturimaksu = 0
      telakkamaksu = 0
      veneet = jasen.boats
      for vene in veneet
        unless jasen.paying_member?(vene.id) then break end
        laituri = Berth.find_by_boat_id(vene.id)
        if !DockyardSpot.find_by_boat_id(vene.id).nil?
          telakka = DockyardSpot.find_by_boat_id(vene.id)
          telakkamaksu = (Pricing.find_by_target("telakanNeliohinta").data)*(telakka.length*telakka.width)
        end
        if !laituri.nil? && laituri.width > 2
          if vene.pituus > 7
            laiturimaksu += (Pricing.find_by_target("minLaituripaikanHintaYli7").data)*laituri.width
          else
            laiturimaksu += (Pricing.find_by_target("minLaituripaikanHintaAlle7").data)*laituri.width
          end
          #laiturimaksu += (Pricing.find_by_target("leveysLaituripaikanHinnanKasvuun").data)*((laituri.width - 2)/0.5).ceil
        end
      end
      vartiosakko = 0
      talkoosakko = 0
      if !jasen.vartiolaiminlyonti.nil?
        vartiosakko += jasen.vartiolaiminlyonti*Pricing.find_by_target("vartioLaiminlyonti").data
      end
      if !jasen.talkoolaiminlyonti.nil?
        talkoosakko = jasen.talkoolaiminlyonti*Pricing.find_by_target("talkoonLaiminlyonti").data
      end
      muut = 0
      if !jasen.saunottu.nil?
        muut += Pricing.find_by_target("saunatunti").data*jasen.saunottu
      end
      erapaiva = Time.now + 1.month #Pricingsi tableen laskunmaksuaika data? Time.now + n.days esim
      luontipaiva = Time.now
      inv = Invoice.create({member_id: jasen.id, nimi: nimi, summa: summa, jno: jno, luontipvm: luontipaiva, liittymismaksu: liittymismaksu, jasenmaksu: jasenmaksu, laiturimaksu: laiturimaksu, varastokoppimaksu: varastomaksu, telakkamaksu: telakkamaksu, erapvm: erapaiva, vartiosakko: vartiosakko, talkoosakko: talkoosakko, muutMaksut: muut, maksettu: false, tunniste: tunniste})
      inv.summa = inv.amount_left_to_pay
      inv.save
    end
  end

  def amount_left_to_pay
    o = {
        'ensirekisterimaksu' => '+',
        'jasenmaksu' => '+',
        'katsastussakko' => '+',
        'laiturimaksu' => '+',
        'laskutuslisa' => '+',
        'liittymismaksu' => '+',
        'muutMaksut' => '+',
        'talkoosakko' => '+',
        'telakkamaksu' => '+',
        'varastokoppimaksu' => '+',
        'vartiosakko' => '+',
        'venerekisterimaksu' => '+',
        'viitesuoritukset' => '-'
    }
    sum = 0.0
    o.each do |k, v|
      field_name = k.to_sym
      unless send(field_name).blank?
        if v.eql?('+')
          sum += send(field_name).to_f
        elsif v.eql?('-')
          sum -= send(field_name).to_f
        end
      end
    end
    (sum - self.payments.sum(:amount)).to_d(2)
  end

  def ensirekisterimaksu=(ensirekisterimaksu)
    write_attribute :ensirekisterimaksu, ensirekisterimaksu.to_s.gsub(',', '.')
  end

  def jasenmaksu=(jasenmaksu)
    write_attribute :jasenmaksu, jasenmaksu.to_s.gsub(',', '.')
  end

  def katsastussakko=(katsastussakko)
    write_attribute :katsastussakko, katsastussakko.to_s.gsub(',', '.')
  end

  def laiturimaksu=(laiturimaksu)
    write_attribute :laiturimaksu, laiturimaksu.to_s.gsub(',', '.')
  end

  def laskutuslisa=(laskutuslisa)
    write_attribute :laskutuslisa, laskutuslisa.to_s.gsub(',', '.')
  end

  def liittymismaksu=(liittymismaksu)
    write_attribute :liittymismaksu, liittymismaksu.to_s.gsub(',', '.')
  end

  def muutMaksut=(muutMaksut)
    write_attribute :muutMaksut, muutMaksut.to_s.gsub(',', '.')
  end

  def suoritukset_kassaan=(suoritukset_kassaan)
    write_attribute :suoritukset_kassaan, suoritukset_kassaan.to_s.gsub(',', '.')
  end

  def talkookerroin=(talkookerroin)
    write_attribute :talkookerroin, talkookerroin.to_s.gsub(',', '.')
  end

  def talkoosakko=(talkoosakko)
    write_attribute :talkoosakko, talkoosakko.to_s.gsub(',', '.')
  end

  def telakkamaksu=(telakkamaksu)
    write_attribute :telakkamaksu, telakkamaksu.to_s.gsub(',', '.')
  end

  def toimihlokerroin=(toimihlokerroin)
    write_attribute :toimihlokerroin, toimihlokerroin.to_s.gsub(',', '.')
  end

  def varastokoppimaksu=(varastokoppimaksu)
    write_attribute :varastokoppimaksu, varastokoppimaksu.to_s.gsub(',', '.')
  end

  def vartiosakko=(vartiosakko)
    write_attribute :vartiosakko, vartiosakko.to_s.gsub(',', '.')
  end

  def venerekisterimaksu=(venerekisterimaksu)
    write_attribute :venerekisterimaksu, venerekisterimaksu.to_s.gsub(',', '.')
  end

  def viitesuoritukset=(viitesuoritukset)
    write_attribute :viitesuoritukset, viitesuoritukset.to_s.gsub(',', '.')
  end

  def summa=(summa)
    write_attribute :summa, summa.to_s.gsub(',', '.')
  end

  def karhuttu=(karhuttu)
    write_attribute :karhuttu, karhuttu.to_s.gsub(',', '.')
  end
end


