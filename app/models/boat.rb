#encoding utf-8

class Boat < ActiveRecord::Base

#dependent->tracking tracks DESTROYs and marks them only as deleted in db.
#or something

versioned :dependent => :tracking
attr_accessible :updated_by

validates_presence_of :RekPvm
validates_presence_of :Nimi
validates_presence_of :tyyppi
validates_presence_of :RekNro
validates_presence_of :ValmMalli
validates_presence_of :Pituus
validates_presence_of :Leveys
validates_presence_of :Syvyys
validates_presence_of :Vuosimalli

validates_numericality_of :Pituus, :greater_than => 0
validates_numericality_of :Leveys, :greater_than => 0
validates_numericality_of :Syvyys
validates_numericality_of :Korkeus, :greater_than => 0
validates_numericality_of :Vuosimalli, :only_integer => true

has_many :BoatsMembers, :dependent => :destroy
has_many :members, :through => :BoatsMembers
has_one :berth
accepts_nested_attributes_for :BoatsMembers, :allow_destroy => true
attr_accessible :BoatsMembers_attributes, :members, :Huomautukset, :JnoOm, :JnoOs, :Katsastus, :Korkeus, :Laituri, :Leveys, :MuutosPvm, :Nimi, :Omistaja, :Pituus, :RekNro, :RekPvm, :Syvyys, :Tarra, :Teho, :Telakka, :Uppouma, :ValmMalli, :VenePuhA, :VenePuhB, :Vuosimalli, :tyyppi, :Laituripaikka, :tag_attributes
end
