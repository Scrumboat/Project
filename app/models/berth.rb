class Berth < ActiveRecord::Base
  belongs_to :dock
  attr_accessible :depth, :exists, :length, :number, :width, :dock_id

end
