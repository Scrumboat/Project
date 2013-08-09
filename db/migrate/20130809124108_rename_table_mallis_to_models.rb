class RenameTableMallisToModels < ActiveRecord::Migration
  def change
  	rename_table :mallis, :models
  end
end