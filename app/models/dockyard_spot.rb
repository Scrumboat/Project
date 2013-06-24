class DockyardSpot < ActiveRecord::Base
  attr_accessible :boat_length, :boat_width, :length, :lift, :number, :trailer, :width, :dockyard_id, :boat_id
  belongs_to :dockyard
  belongs_to :boat
  accepts_nested_attributes_for :boat
end
