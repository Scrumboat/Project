# encoding: utf-8
class Berth < ActiveRecord::Base
  belongs_to :dock
  belongs_to :boat
  attr_accessible :depth, :exists, :length, :number, :width, :dock_id, :reknro, :jno, :vartio, :boat_id
  before_save :reknro_default_value
  def reknro_default_value
    self.reknro ||= ""
  end
  def printExists
  	print_exists = 'Ei'
  	if self[:exists]
  		print_exists = 'Kyllä'
  	end
  	return print_exists
  end
end
