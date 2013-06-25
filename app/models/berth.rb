# encoding: utf-8
class Berth < ActiveRecord::Base
  belongs_to :dock
  attr_accessible :depth, :exists, :length, :number, :width, :dock_id

  #before_save :set_default_val

  def set_default_val
    if self.exists = nill
    	self.exists = false
    end
  end

  validates :number, :presence => true, :numericality => { :only_integer => true }, :uniqueness => true
  validates :width, :presence => true
  validates :length, :presence => true
  validates :depth, :presence => true

  def printExists
  	print_exists = 'Ei'
  	if self[:exists]
  		print_exists = 'Kyllä'
  	end
  	return print_exists
  end
end
