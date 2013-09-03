class RenameBerthBoatIdToReknro < ActiveRecord::Migration
  def change
    rename_column :berths, :boat_id, :boat_reknro
  end
end
