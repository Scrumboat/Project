class Guardturn < ActiveRecord::Base
  belongs_to :guardseason
  attr_accessible :jno, :vartiointi_pvm
end
