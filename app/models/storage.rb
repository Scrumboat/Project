class Storage < ActiveRecord::Base
  validates_presence_of :jno
  validates_presence_of :vk
  validates_presence_of :pala
  belongs_to :member
  attr_accessible :jno, :koppimk, :pala, :vk, :member_id
end
