class Invoice < ActiveRecord::Base
  belongs_to :member, :foreign_key => 'member_id'
  attr_accessible :annetutHyvitykset, :edellisenKaudenLaskutus, :ensirekisterimaksu, :jasenmaksu, :jno, :katsastussakko, :laiturimaksu, :laskutuslisa, :liittymismaksu, :maksetunSummanPalautus, :muutMaksut, :nimi, :suorituksetIlmanViitetta, :suorituksetKassaan, :talkookerroin, :talkoosakko, :telakkamaksu, :toimihlokerroin, :varastokoppimaksu, :vartiosakko, :venerekisterimaksu, :viitesuoritukset, :luontipvm, :lahetyspvm, :tunniste, :maksettu, :erapvm, :member_id, :summa, :viitenumero, :karhuttu, :vapaasana
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
    @jasenet = Member.all
	for jasen in @jasenet
	  if jasen.EmailFax != nil
	    for invoice in jasen.invoices
	      if !invoice.maksettu
		    InvoiceMailer.lasku(jasen, invoice).deliver 
		  end
	    end
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
      erapaiva = Time.now + 2.weeks #Pricingsi tableen laskunmaksuaika data? Time.now + n.days esim
      luontipaiva = Time.now
      summa = liittymismaksu + jasenmaksu + varastomaksu + laiturimaksu + telakkamaksu  # TODO: TARVITSEE SAKOT YMS
      Invoice.create({member_id: jasen.id, nimi: nimi, summa: summa, jno: jno, luontipvm: luontipaiva, liittymismaksu: liittymismaksu, jasenmaksu: jasenmaksu, laiturimaksu: laiturimaksu,varastokoppimaksu: varastomaksu, telakkamaksu: telakkamaksu, erapvm: erapaiva, vartiosakko: 300, maksettu: false, tunniste: tunniste})
    end
  end

end
