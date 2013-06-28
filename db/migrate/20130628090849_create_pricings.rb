class CreatePricings < ActiveRecord::Migration
  def change
    create_table :pricings do |t|
      t.string :target
      t.float :data

      t.timestamps
    end
  end
end
