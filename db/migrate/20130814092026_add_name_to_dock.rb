class AddNameToDock < ActiveRecord::Migration
  def change
       add_column :docks, :name, :String
  end
end
