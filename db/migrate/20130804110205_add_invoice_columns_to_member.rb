class AddInvoiceColumnsToMember < ActiveRecord::Migration
  def change
    add_column :members, :annetutHyvitykset, :decimal
	add_column :members, :suorituksetIlmanViitetta, :decimal
	add_column :members, :maksetunSummanPalautus, :decimal
	add_column :members, :edellisenKaudenLaskutus, :decimal
  end
end
