class AddSummaToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :summa, :decimal
  end
end
