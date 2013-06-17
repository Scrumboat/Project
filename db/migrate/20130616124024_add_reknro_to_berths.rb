class AddReknroToBerths < ActiveRecord::Migration
  def change
    add_column :berths, :Reknro, :string
  end
end
