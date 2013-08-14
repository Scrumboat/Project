class Dock < ActiveRecord::Base
  attr_accessible :name, :length
  has_many :berths
end
