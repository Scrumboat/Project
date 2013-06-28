class RemoveObsoloteColumns < ActiveRecord::Migration

  def change
    remove_column :boats, :JnoOm
    remove_column :boats, :JnoOs
    remove_column :boats, :Laituripaikka
    remove_column :boats, :Laituri
    remove_column :boats, :Omistaja

    remove_column :members, :VeneRekNro
  end
end
