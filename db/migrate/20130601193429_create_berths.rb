class CreateBerths < ActiveRecord::Migration
  def change
    create_table :berths do |t|
      t.integer :number
      t.decimal :length
      t.decimal :width
      t.decimal :depth
      t.boolean :exists
      t.references :dock

      t.timestamps
    end
    add_index :berths, :dock_id
  end
end
