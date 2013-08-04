class AddKarhuttuToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :karhuttu, :integer
  end
end
