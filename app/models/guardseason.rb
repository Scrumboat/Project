class Guardseason < ActiveRecord::Base
  versioned :dependent => :tracking
  has_many :guardturns
  attr_accessible :alku_pvm, :loppu_pvm, :nimi

  def self.alustavartiopaivat(guardseason_id)
    #@members = Member.all.cycle
    #@member = @members.shift
    @guardseason = Guardseason.where(:id => guardseason_id).first
    @paivat = (@guardseason.alku_pvm..@guardseason.loppu_pvm)
    @paivat.each do |paiva|
      @guardturn = Guardturn.where(:guardseason_id => guardseason_id, :vartiointi_pvm => paiva).first
      if @guardturn.nil?
        Guardturn.alustavartiopaivat(guardseason_id, paiva)
        #@member = @members.shift
      end
    end
  end

  def self.alustavartiovuorot(guardseason_id)

    @edellinenGuardseason = Guardseason.where(:id => (guardseason_id.to_i-1)).first
    if @edellinenGuardseason.nil?
       @ekaKausi = true
     #  @vikaguardturnjno = "666"
    else
       @ekaKausi = false
       @vikaguardturnjno = Guardturn.where(:guardseason_id => (guardseason_id.to_i-1)).last
    end
    #@boat = Boat.where(:id => 1).first
    #@boat.huomautukset = @vikaguardturnjno.jno
    #@boat.save

    @members = Member.where(:deleted => false).map(&:jno).sort

    if @ekaKausi == false
        while @members.first != @vikaguardturnjno.jno
            @members.shift
        end
        @members.shift #koska muuten tulee 2 vartiointivuoroa samalle jno:lle putkeen
    end
  #  if @ekaKausi == false
  #    @members.shift #koska muuten tulee 2 vartiointivuoroa samalle jno:lle putkeen
  #  end
  # while @members.first != @vikaguardturnjno
  #    @member = @members.shift
  #    if @member.nil?
  #      @members = Member.where(:deleted => false)
  #    end
  #  end

    @guardseason = Guardseason.where(:id => guardseason_id).first
    @paivat = (@guardseason.alku_pvm..@guardseason.loppu_pvm)
    @paivat.each do |paiva|
      @guardturn = Guardturn.where(:guardseason_id => guardseason_id, :vartiointi_pvm => paiva).first
      if @guardturn.vartioidaanko
        @member = @members.shift
        if @members.first.nil?
          @members = Member.where(:deleted => false).map(&:jno).sort
        end
        @guardturn.jno = @member
        @guardturn.save
      else
        @guardturn.jno = nil
        @guardturn.save
      end
    end
  end
end
