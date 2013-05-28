class Dock < ActiveRecord::Base
  attr_accessible :depth, :exists, :length, :number, :width
end
