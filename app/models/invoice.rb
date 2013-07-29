class Invoice < ActiveRecord::Base
  belongs_to :member
  attr_accessible :annetutHyvitykset, :edellisenKaudenLaskutus, :ensirekisterimaksu, :jasenmaksu, :jno, :katsastussakko, :laiturimaksu, :laskutuslisa, :liittymismaksu, :maksetunSummanPalautus, :muutMaksut, :nimi, :suorituksetIlmanViitetta, :suorituksetKassaan, :talkookerroin, :talkoosakko, :telakkamaksu, :toimihlokerroin, :varastokoppimaksu, :vartiosakko, :venerekisterimaksu, :viitesuoritukset, :luontipvm, :lahetyspvm, :tunniste, :maksettu, :erapvm, :member_id
  
  def self.search(search)
    if search == "paid"
	  find(:all, :conditions => ['"maksettu" LIKE ?', true])
	elsif search == "unpaid"
	  find(:all, :conditions => ['"maksettu" LIKE ?', false])
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

  def self.createInvoices()
    @jasenet = Member.all
    for jasen in @jasenet
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
      Invoice.create({member_id: jasen.id, nimi: nimi, jno: jno, luontipvm: luontipaiva, liittymismaksu: liittymismaksu, jasenmaksu: jasenmaksu, laiturimaksu: laiturimaksu,varastokoppimaksu: varastomaksu, telakkamaksu: telakkamaksu, erapvm: erapaiva, vartiosakko: 300, maksettu: false})
    end
  end
end
