class RemoveColumnsFromInvoice < ActiveRecord::Migration
  def change
    remove_column :invoices, :annetutHyvitykset
	remove_column :invoices, :suorituksetIlmanViitetta
	remove_column :invoices, :maksetunSummanPalautus
	remove_column :invoices, :edellisenKaudenLaskutus
  end
end
