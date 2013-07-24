class AddErapvmToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :erapvm, :date
  end
end
