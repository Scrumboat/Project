class AddLaituriAndLaituripaikkaToBoat < ActiveRecord::Migration
  def change
    add_column :boats, :laituri, :string
    add_column :boats, :laituripaikka, :string
  end
end
