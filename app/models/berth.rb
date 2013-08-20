# encoding: utf-8
class Berth < ActiveRecord::Base
  belongs_to :dock
  belongs_to :boat

  attr_accessible :depth, :exists, :length, :number, :width, :dock_id, :reknro, :jno, :vartio, :boat_id

  before_save :reknro_default_value

  validates_numericality_of :number, :only_integer => true
  validates :number, :presence => true, :uniqueness => true, length: {maximum: 2}, :numericality => { :greater_than_or_equal_to => 1 }

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

    def length=(length)
    write_attribute :length, length.to_s.gsub(',', '.')
  end

    def depth=(depth)
    write_attribute :depth, depth.to_s.gsub(',', '.')
  end

      def width=(width)
    write_attribute :width, width.to_s.gsub(',', '.')
  end

  

end
