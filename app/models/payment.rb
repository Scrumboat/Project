class Payment < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :payment_date, :amount, :ref_number, :id, :need_survey, :invoice_id, :raw_data, :cash_payment
  belongs_to :invoice

  validates_presence_of :amount, :invoice_id, :ref_number, :payment_date
end
