class CreateDocks < ActiveRecord::Migration
  def change
    create_table :docks do |t|
      t.float :length
      t.float :width
      t.float :depth
      t.boolean :exists
      t.integer :number

      t.timestamps
    end
  end
end
