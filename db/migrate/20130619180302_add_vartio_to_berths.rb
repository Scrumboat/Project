class AddVartioToBerths < ActiveRecord::Migration
  def change
    add_column :berths, :vartio, :date
  end
end
