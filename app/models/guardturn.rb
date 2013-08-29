class Guardturn < ActiveRecord::Base
  versioned :dependent => :tracking
  belongs_to :guardseason
  attr_accessible :jno, :vartiointi_pvm, :vartioidaanko

  def self.alustavartiopaivat(guardseason_id, pvm)
      guardturn = Guardturn.new
      guardturn.vartiointi_pvm = pvm
      guardturn.guardseason_id = guardseason_id
      guardturn.vartioidaanko = true
      guardturn.save
  end
end
