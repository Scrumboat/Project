class AddColumnsToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :luontipvm, :date
    add_column :invoices, :lahetyspvm, :date
    add_column :invoices, :tunniste, :string
    add_column :invoices, :maksettu, :boolean, default: false
  end
end
