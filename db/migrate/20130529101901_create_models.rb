class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
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
