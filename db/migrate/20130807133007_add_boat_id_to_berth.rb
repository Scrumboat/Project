class AddBoatIdToBerth < ActiveRecord::Migration
  def change
    add_column :berths, :boat_id, :integer
  end
end
