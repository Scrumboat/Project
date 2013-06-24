class AddBoatToDockyardSpots < ActiveRecord::Migration
  def change
    add_column :dockyard_spots, :boat_id, :integer
  end
end
