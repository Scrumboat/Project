class Dockyard < ActiveRecord::Base
  attr_accessible :length, :name, :width
  has_many :dockyard_spots
end
