class Employment < ActiveRecord::Base
  versioned :dependent => :tracking
  attr_accessible :hyvityksenSuuruus, :nimi
  
  belongs_to :member
end
