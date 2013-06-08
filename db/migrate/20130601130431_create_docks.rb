class CreateDocks < ActiveRecord::Migration
  def change
    create_table :docks do |t|
      t.decimal :length
      t.references :berth
      t.timestamps
    end
  end
end
