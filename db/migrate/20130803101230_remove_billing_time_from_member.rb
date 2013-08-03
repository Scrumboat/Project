class RemoveBillingTimeFromMember < ActiveRecord::Migration
  def change
  	remove_column :members, :laskutuskerta
  end
end
