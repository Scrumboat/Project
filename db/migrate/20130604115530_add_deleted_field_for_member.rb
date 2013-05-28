class AddDeletedFieldForMember < ActiveRecord::Migration
  def up
    add_column :members, :deleted, :boolean, :default => false
  end

  def down
    remove_column :members, :deleted
  end
end
