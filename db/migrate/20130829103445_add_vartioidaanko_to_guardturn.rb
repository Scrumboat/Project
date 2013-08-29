class AddVartioidaankoToGuardturn < ActiveRecord::Migration
  def change
     add_column :guardturns, :vartioidaanko, :boolean
  end
end
