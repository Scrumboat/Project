class Dockyard < ActiveRecord::Base
  versioned :dependent => :tracking
  attr_accessible :length, :name, :width
  has_many :dockyard_spots

      def length=(length)
    write_attribute :length, length.to_s.gsub(',', '.')
  end
      def width=(width)
    write_attribute :width, width.to_s.gsub(',', '.')
  end
end
