class Dock < ActiveRecord::Base
  attr_accessible :name, :length
  has_many :berths

    def length=(length)
    write_attribute :length, length.to_s.gsub(',', '.')
  end
  
end
