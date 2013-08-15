class AddNameToDock < ActiveRecord::Migration
  def change
       add_column :docks, :name, :string
  end
end
