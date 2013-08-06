class Payment < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :payment_date, :amount, :ref_number, :id, :need_survey, :invoice_id, :raw_data
  belongs_to :invoice
end
