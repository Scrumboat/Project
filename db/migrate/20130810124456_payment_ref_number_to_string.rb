class PaymentRefNumberToString < ActiveRecord::Migration
  def change
    change_column :payments, :ref_number, :string
  end

end
