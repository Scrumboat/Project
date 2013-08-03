class AddBillingTimeToMember < ActiveRecord::Migration
  def change
    add_column :members, :laskutuskerta, :string
  end
end
