class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.string :Omistaja
      t.string :JnoOm
      t.string :JnoOs
      t.date :RekPvm
      t.date :MuutosPvm
      t.string :Nimi
      t.string :tyyppi
      t.string :RekNro
      t.string :ValmMalli
      t.decimal :Pituus
      t.decimal :Leveys
      t.decimal :Syvyys
      t.decimal :Uppouma
      t.decimal :Korkeus
      t.string :Teho
      t.integer :Vuosimalli
      t.string :VenePuhA
      t.string :VenePuhB
      t.string :Huomautukset
      t.integer :Tarra
      t.string :Katsastus
      t.string :Laituri
      t.string :Telakka

      t.timestamps
    end
  end
end
