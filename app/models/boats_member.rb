class BoatsMember < ActiveRecord::Base
belongs_to :member
belongs_to :boat
  attr_accessible :boat_id, :member_id
end
