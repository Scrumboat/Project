class RemoveJasennumeroFromBerth < ActiveRecord::Migration
  def change
    remove_column :berths, :jno
  end
end
