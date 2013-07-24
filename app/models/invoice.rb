class Invoice < ActiveRecord::Base
  belongs_to :member
  attr_accessible :annetutHyvitykset, :edellisenKaudenLaskutus, :ensirekisterimaksu, :jasenmaksu, :jno, :katsastussakko, :laiturimaksu, :laskutuslisa, :liittymismaksu, :maksetunSummanPalautus, :muutMaksut, :nimi, :suorituksetIlmanViitetta, :suorituksetKassaan, :talkookerroin, :talkoosakko, :telakkamaksu, :toimihlokerroin, :varastokoppimaksu, :vartiosakko, :venerekisterimaksu, :viitesuoritukset, :luontipvm, :lahetyspvm, :tunniste, :maksettu, :erapvm, :member_id
  
  def self.search()
    find(:all, :conditions => ['"maksettu" LIKE ?', true])
  end
  def eraantynyt()
    if self.erapvm < DateTime.now.to_date
      return true
    else
      return false
    end
  end
end
