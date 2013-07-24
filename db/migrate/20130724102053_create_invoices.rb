class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :nimi
      t.integer :jno
      t.string :toimihlokerroin
      t.integer :talkookerroin
      t.decimal :viitesuoritukset
      t.decimal :suorituksetIlmanViitetta
      t.decimal :suorituksetKassaan
      t.decimal :annetutHyvitykset
      t.decimal :maksetunSummanPalautus
      t.decimal :liittymismaksu
      t.decimal :jasenmaksu
      t.decimal :edellisenKaudenLaskutus
      t.decimal :venerekisterimaksu
      t.decimal :varastokoppimaksu
      t.decimal :laiturimaksu
      t.decimal :ensirekisterimaksu
      t.decimal :telakkamaksu
      t.decimal :muutMaksut
      t.decimal :talkoosakko
      t.decimal :katsastussakko
      t.decimal :vartiosakko
      t.decimal :laskutuslisa

      t.timestamps
    end
  end
end
