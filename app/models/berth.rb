# encoding: utf-8
class Berth < ActiveRecord::Base
  belongs_to :dock
  attr_accessible :depth, :exists, :length, :number, :width, :dock_id

  def printExists
  	print_exists = 'Ei'
  	if self[:exists]
  		print_exists = 'Kyllä'
  	end
  	return print_exists
  end
end
