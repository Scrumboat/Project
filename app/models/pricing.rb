class Pricing < ActiveRecord::Base
  attr_accessible :data, :target

  monetize :data
  
      def data=(data)
    write_attribute :data, data.to_s.gsub(',', '.')
  end
end
