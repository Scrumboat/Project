class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.column :payment_date, :date
      t.column :amount, :decimal
      t.column :ref_number, :integer
      t.column :need_survey, :boolean
      t.column :invoice_id, :integer
      t.column :raw_data, :string
      t.timestamps
    end
  end
end
