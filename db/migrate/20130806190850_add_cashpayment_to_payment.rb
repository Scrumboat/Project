class AddCashpaymentToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :cash_payment, :boolean
  end
end
