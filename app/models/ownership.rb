class Ownership < ActiveRecord::Base
  # attr_accessible :title, :body
	belongs_to :boat
	belongs_to :member
end
