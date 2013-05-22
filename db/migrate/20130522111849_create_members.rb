class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :Nimi
      t.integer :Jno
      t.string :Sotu
      t.date :Liittynyt
      t.string :JK
      t.date :MuutosPvm
      t.string :Toimi
      t.string :Lisenssi
      t.string :Osoite
      t.string :Posti
      t.string :Maa
      t.string :KotiPuh
      t.string :MatkaPuh
      t.string :TyoPuh
      t.string :EmailFax
      t.string :Ammatti
      t.string :Laivuri
      t.string :Huom
      t.string :Varasto
      t.string :Avain

      t.timestamps
    end
  end
end
