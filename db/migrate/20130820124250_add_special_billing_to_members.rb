class AddSpecialBillingToMembers < ActiveRecord::Migration
  def change
    add_column :members, :special_billing, :boolean
  end
end
