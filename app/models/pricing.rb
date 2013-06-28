class Pricing < ActiveRecord::Base
  attr_accessible :data, :target
  monetize :data
end
