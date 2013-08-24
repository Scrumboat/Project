class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.string :nimi
      t.integer :hyvityksenSuuruus

      t.timestamps
    end
  end
end
