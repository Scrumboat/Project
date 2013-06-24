class CreateDockyards < ActiveRecord::Migration
  def change
    create_table :dockyards do |t|
      t.string :name
      t.float :length
      t.float :width

      t.timestamps
    end
  end
end
