class Guardturn < ActiveRecord::Base
  versioned :dependent => :tracking
  belongs_to :guardseason
  attr_accessible :jno, :vartiointi_pvm

  def self.luovartiovuorot(guardseason_id, pvm, jno)
   guardturn = Guardturn.new
   guardturn.vartiointi_pvm = pvm
   guardturn.jno = jno
   guardturn.guardseason_id = guardseason_id
   guardturn.save
  end

end
