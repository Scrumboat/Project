class Invoice < ActiveRecord::Base
  attr_accessible :annetutHyvitykset, :edellisenKaudenLaskutus, :ensirekisterimaksu, :jasenmaksu, :jno, :katsastussakko, :laiturimaksu, :laskutuslisa, :liittymismaksu, :maksetunSummanPalautus, :muutMaksut, :nimi, :suorituksetIlmanViitetta, :suorituksetKassaan, :talkookerroin, :talkoosakko, :telakkamaksu, :toimihlokerroin, :varastokoppimaksu, :vartiosakko, :venerekisterimaksu, :viitesuoritukset
end
