class AddLaituripaikkaToBoats < ActiveRecord::Migration
  def change
    add_column :boats, :Laituripaikka, :integer
  end
end
