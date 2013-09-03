class ChangeReknroToString < ActiveRecord::Migration
  def change
    change_column :berths, :boat_reknro, :string
  end
end
