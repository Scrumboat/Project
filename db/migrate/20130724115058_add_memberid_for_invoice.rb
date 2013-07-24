class AddMemberidForInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :member_id, :integer
  end
end
