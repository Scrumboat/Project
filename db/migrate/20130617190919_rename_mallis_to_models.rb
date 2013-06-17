class RenameMallisToModels < ActiveRecord::Migration
  def up
	rename_table :mallis, :models
  end

  def down
	rename_table :models, :mallis
  end
end
