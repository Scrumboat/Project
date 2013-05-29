class AddBoatidToOwnership < ActiveRecord::Migration
  def change
    add_column :ownerships, :boat_id, :integer
  end
end
