class Guardseason < ActiveRecord::Base
  versioned :dependent => :tracking
  has_many :guardturns
  attr_accessible :alku_pvm, :loppu_pvm, :nimi

  def self.luovartiovuorot(guardseason_id)
    @members = Member.all.cycle
    @member = @members.shift
    @guardseason = Guardseason.where(:id => guardseason_id).first
    @paivat = (@guardseason.alku_pvm..@guardseason.loppu_pvm)
    @paivat.each do |paiva|
        Guardturn.luovartiovuorot(guardseason_id, paiva, @member)
        @member = @members.shift
    end
  end
end
