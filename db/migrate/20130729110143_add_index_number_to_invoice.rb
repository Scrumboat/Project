class AddIndexNumberToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :viitenumero, :string
  end
end
