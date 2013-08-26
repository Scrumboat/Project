class AddBillingBooleansToMembers < ActiveRecord::Migration
  def change
    add_column :members, :berthrefund, :boolean, :default => false
    add_column :members, :dockyardspotrefund, :boolean, :default => false
    add_column :members, :storagerefund, :boolean, :default => false
    add_column :members, :membershiprefund, :boolean, :default => false
  end
end
