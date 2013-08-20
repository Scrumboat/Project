class Payment < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :payment_date, :amount, :ref_number, :id, :need_survey, :invoice_id, :raw_data, :cash_payment
  belongs_to :invoice

  validates_presence_of :amount, :ref_number, :payment_date

      def amount=(amount)
    write_attribute :amount, amount.to_s.gsub(',', '.')
  end
end
