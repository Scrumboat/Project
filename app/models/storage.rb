class Storage < ActiveRecord::Base
  validates_uniqueness_of :vk
  validates_presence_of :vk
  validates_presence_of :pala
  belongs_to :member
  attr_accessible :jno, :pala, :vk, :member_id
  
  def self.search(search)
    if search == "tyhjat"
	    find_all_by_jno(nil)
    else
      find(:all)
	end
  end
end
