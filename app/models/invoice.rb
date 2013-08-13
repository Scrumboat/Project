class Invoice < ActiveRecord::Base
  belongs_to :member, :foreign_key => 'member_id'
  attr_accessible :ensirekisterimaksu, :jasenmaksu, :jno, :katsastussakko, :laiturimaksu, :laskutuslisa, :liittymismaksu, :muutMaksut, :nimi, :suorituksetKassaan, :talkookerroin, :talkoosakko, :telakkamaksu, :toimihlokerroin, :varastokoppimaksu, :vartiosakko, :venerekisterimaksu, :viitesuoritukset, :luontipvm, :lahetyspvm, :tunniste, :maksettu, :erapvm, :member_id, :summa, :viitenumero, :karhuttu, :vapaasana
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
  
  def self.laskuta()
    yhdistettavat = []
    @jasenet = Member.all
	for jasen in @jasenet
	  if jasen.EmailFax != nil
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
			    invoice.lahetystapa = "Posti"
			    invoice.save
		    end
		  end
	  end
	end
	counter = 0
	filuja = 0
	haluttumaaraperpdf = 2
	pdf = Prawn::Document.new
	  for lasku in yhdistettavat
	    if filuja%haluttumaaraperpdf == 0 && filuja != 0
		  pdf.render_file counter.to_s+".pdf"
		  pdf = Prawn::Document.new
		  counter += 1
		end
	    @invoice = lasku
	    @member = Member.find_by_Jno(@invoice.jno)
        pdf.text "Lasku #{@invoice.tunniste}"
	    pdf.move_down 10
	    pdf.text "Nimi:  #{@invoice.nimi}"
	    pdf.move_down 10
	    pdf.text "Jasennumero:  #{@invoice.jno}"
	    pdf.move_down 10
	    pdf.text "Osoite:  #{@member.Osoite}"
	    pdf.move_down 10
	    pdf.text "Posti:  #{@member.Posti}"
	    pdf.move_down 10
	    pdf.text "Email:  #{@member.EmailFax}"
	    pdf.move_down 10
	    pdf.text "Katsastussakko:  #{@invoice.katsastussakko}"
	    pdf.move_down 10
	    pdf.text "Laiturimaksu:  #{@invoice.laiturimaksu}"
	    pdf.move_down 10
        pdf.text "Liittymismaksu:  #{@invoice.liittymismaksu}"
	    pdf.move_down 10
	    pdf.text "Muut maksut:  #{@invoice.muutMaksut}"
	    pdf.move_down 10
	    pdf.text "Talkoosakko:  #{@invoice.talkoosakko}"
	    pdf.move_down 10
	    pdf.text "Telakkamaksu:  #{@invoice.telakkamaksu}"
	    pdf.move_down 10
	    pdf.text "Varastokoppimaksu:  #{@invoice.varastokoppimaksu}"
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
      nimi = jasen.Nimi
      jno = jasen.Jno
      liittymismaksu = 0
      if jasen.Liittynyt > (Date.today - 6.months)
        liittymismaksu = Pricing.find_by_target("liittymismaksu").data
      end
      jasenmaksu = Pricing.find_by_target("jasenmaksu").data
      varastomaksu = 0
      if !jasen.Varasto.blank?
        varastomaksu = (Pricing.find_by_target("varastokoppinelio").data)*(Storage.find_by_vk(jasen.Varasto).pala)
      end
      laiturimaksu = Pricing.find_by_target("minLaituripaikanHinta").data
      telakkamaksu = 0
      veneet = jasen.boats
      for vene in veneet
        #veneelle voisi luoda boolean muuttujakentän siitä että onko veneen laiturimaksu jo laskutettu jos on monta omistajaa samalla veneellä, jos true niin skipattais tässä
        laituri = Berth.find_by_Reknro(vene.RekNro)
        if !DockyardSpot.find_by_boat_id(vene.id).nil?
          telakka = DockyardSpot.find_by_boat_id(vene.id)
          telakkamaksu = (Pricing.find_by_target("telakanNeliohinta").data)*(telakka.length*telakka.width)
        end
        if !laituri.nil? && laituri.width > 2
          laiturimaksu += (Pricing.find_by_target("leveysLaituripaikanHinnanKasvuun").data)*((laituri.width - 2)/0.5).ceil
        end
      end
      erapaiva = Time.now + 1.month #Pricingsi tableen laskunmaksuaika data? Time.now + n.days esim
      luontipaiva = Time.now
      inv = Invoice.create({member_id: jasen.id, nimi: nimi, summa: summa, jno: jno, luontipvm: luontipaiva, liittymismaksu: liittymismaksu, jasenmaksu: jasenmaksu, laiturimaksu: laiturimaksu,varastokoppimaksu: varastomaksu, telakkamaksu: telakkamaksu, erapvm: erapaiva, vartiosakko: 300, maksettu: false, tunniste: tunniste})
      inv.summa = inv.amount_left_to_pay
      inv.save
    end
  end

  def amount_left_to_pay
    o = {
        'ensirekisterimaksu' => '+',
        'jasenmaksu'         => '+',
        'katsastussakko'     => '+',
        'laiturimaksu'       => '+',
        'laskutuslisa'       => '+',
        'liittymismaksu'     => '+',
        'muutMaksut'         => '+',
        'talkoosakko'        => '+',
        'telakkamaksu'       => '+',
        'varastokoppimaksu'  => '+',
        'vartiosakko'        => '+',
        'venerekisterimaksu' => '+',
        'viitesuoritukset'   => '-'
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
    (sum - payments.sum(:amount)).to_d(2)
  end
end