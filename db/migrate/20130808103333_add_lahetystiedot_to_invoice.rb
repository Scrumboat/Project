class AddLahetystiedotToInvoice < ActiveRecord::Migration
  def change
      add_column :invoices, :lahetystapa, :string
      add_column :invoices, :lahetetty, :boolean, default: false
  end
end
