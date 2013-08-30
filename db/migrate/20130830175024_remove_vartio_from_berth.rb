class RemoveVartioFromBerth < ActiveRecord::Migration
  def change
    remove_column :berths, :vartio
  end
end
