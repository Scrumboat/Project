class RenameBerthBoatReknroToBoatId < ActiveRecord::Migration
  def change
    rename_column :berths, :boat_reknro, :boat_id
  end
end
