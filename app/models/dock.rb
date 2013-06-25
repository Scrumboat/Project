class Dock < ActiveRecord::Base
  attr_accessible :length
  has_many :berths
  validates :length, :presence => true

  def hasSpaceFor berth
  	hasSpaceForWidth berth.width
  end

  def hasSpaceForNewWidth newWidth, berth
  	old_width = berth.width
  	return length >= (currentWidthUsed - old_width + newWidth)
  end


  def currentWidthUsed
  	return Berth.where(:dock_id => self.id).sum('width')
  end

  def hasSpaceForWidth width
  	return spaceLeft >= width
  end

  def spaceLeft
  	return length - currentWidthUsed
  end
end
