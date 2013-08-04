class AddVapaasanaToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :vapaasana, :string
  end
end
