class CreateStorages < ActiveRecord::Migration
  def change
    create_table :storages do |t|
      t.string :vk
      t.decimal :pala
      t.integer :jno
      t.integer :koppimk

      t.timestamps
    end
  end
end
