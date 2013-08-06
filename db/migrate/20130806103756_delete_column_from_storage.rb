class DeleteColumnFromStorage < ActiveRecord::Migration
  def change
    remove_column :storages, :koppimk
  end
end
