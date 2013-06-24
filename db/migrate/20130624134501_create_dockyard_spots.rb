class CreateDockyardSpots < ActiveRecord::Migration
  def change
    create_table :dockyard_spots do |t|
      t.integer :number
      t.float :length
      t.float :width
      t.float :boat_width
      t.float :boat_length
      t.boolean :trailer
      t.boolean :lift

      t.timestamps
    end
  end
end
