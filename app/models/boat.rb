#encoding utf-8

class Boat < ActiveRecord::Base

#dependent->tracking tracks DESTROYs and marks them only as deleted in db.
#or something

versioned :dependent => :tracking
attr_accessible :updated_by

validates_presence_of :rek_pvm
validates_presence_of :nimi
validates_presence_of :tyyppi
validates_presence_of :reknro
validates_presence_of :valm_malli
validates_presence_of :pituus
validates_presence_of :leveys
validates_presence_of :syvyys
validates_presence_of :vuosimalli

validates_numericality_of :pituus, :greater_than => 0
validates_numericality_of :leveys, :greater_than => 0
validates_numericality_of :syvyys, :greater_than => 0
validates_numericality_of :vuosimalli, :only_integer => true

has_many :BoatsMembers, :dependent => :destroy
has_many :members, :through => :BoatsMembers
has_one :berth
has_one :dockyard_spot

belongs_to :model

accepts_nested_attributes_for :BoatsMembers, :allow_destroy => true
attr_accessible :BoatsMembers_attributes, :members, :huomautukset, :katsastus, :korkeus, :Laituri, :leveys, :muutos_pvm, :nimi, :pituus, :reknro, :rek_pvm, :syvyys, :tarra, :teho, :telakka, :uppouma, :valm_malli, :vene_puh_a, :vene_puh_b, :vuosimalli, :laituri, :laituripaikka, :tyyppi, :tag_attributes
def self.search(search)
  if search
    #@omistajat = Member.where(:nimi => search).map(&:id)
    @omistajat = Member.where("nimi LIKE ?", "%"+search+"%").map(&:id)
    @bmt = BoatsMember.where(:member_id => @omistajat).all
    @veneet = []
    for bm in @bmt
      @veneet << bm.boat_id
    end
    #Boat.where(:id => @veneet).all
    if @veneet.empty?
      find(:all, :conditions => ['"reknro" LIKE ? OR "nimi" LIKE ?', "%#{search}%", "%#{search}%"])
    else
      #find(:all, :conditions => ['"reknro" LIKE ? OR "nimi" LIKE ? OR id IN ?', "%#{search}%", "%#{search}%", @veneet])
      Boat.where(:id => @veneet).all
    end
    
  else
    find(:all)
  end
end
# Pilkut muutetaan pisteiksi
def pituus=(pituus)
    write_attribute :pituus, pituus.to_s.gsub(',', '.')
end

def leveys=(leveys)
    write_attribute :leveys, leveys.to_s.gsub(',', '.')
end

def syvyys=(syvyys)
    write_attribute :syvyys, syvyys.to_s.gsub(',', '.')
end

def korkeus=(korkeus)
    write_attribute :korkeus, korkeus.to_s.gsub(',', '.')
end

def uppouma=(uppouma)
    write_attribute :uppouma, uppouma.to_s.gsub(',', '.')
end

end
