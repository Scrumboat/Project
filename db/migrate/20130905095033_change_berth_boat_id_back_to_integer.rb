class ChangeBerthBoatIdBackToInteger < ActiveRecord::Migration
  def change
    change_column :berths, :boat_id, :integer
  end
end
