class Guardturn < ActiveRecord::Base
  versioned :dependent => :tracking
  belongs_to :guardseason
  attr_accessible :jno, :vartiointi_pvm
end
