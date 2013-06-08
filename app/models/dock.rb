class Dock < ActiveRecord::Base
  attr_accessible :length
  has_many :berths
end
