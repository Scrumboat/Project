class AddVeneRekNroToMember < ActiveRecord::Migration
  def change
    add_column :members, :VeneRekNro, :string
  end
end
