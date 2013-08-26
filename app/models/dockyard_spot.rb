class DockyardSpot < ActiveRecord::Base
  versioned :dependent => :tracking
  attr_accessible :boat_length, :boat_width, :length, :lift, :number, :trailer, :width, :dockyard_id, :boat_id
  belongs_to :dockyard
  belongs_to :boat
  accepts_nested_attributes_for :boat

    def length=(length)
    write_attribute :length, length.to_s.gsub(',', '.')
  end

      def width=(width)
    write_attribute :width, width.to_s.gsub(',', '.')
  end

end
