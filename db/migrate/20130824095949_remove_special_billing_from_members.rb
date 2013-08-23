class RemoveSpecialBillingFromMembers < ActiveRecord::Migration
def change
  remove_column :members, :special_billing
end
end
