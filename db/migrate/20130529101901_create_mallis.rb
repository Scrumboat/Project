class CreateMallis < ActiveRecord::Migration
  def change
    create_table :mallis do |t|
      t.string :tyyppi
      t.string :ValmMalli
      t.decimal :Pituus
      t.decimal :Leveys
      t.decimal :Syvyys
      t.decimal :Uppouma
      t.decimal :Korkeus

      t.timestamps
    end
  end
end
