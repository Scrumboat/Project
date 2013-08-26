class Employment < ActiveRecord::Base
  attr_accessible :hyvityksenSuuruus, :nimi
  
  belongs_to :member
end
