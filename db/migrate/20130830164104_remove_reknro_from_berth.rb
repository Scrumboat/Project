class RemoveReknroFromBerth < ActiveRecord::Migration
  def change
    remove_column :berths, :reknro
  end
end
