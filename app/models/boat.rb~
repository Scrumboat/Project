#encoding utf-8

class Boat < ActiveRecord::Base

#dependent->tracking tracks DESTROYs and marks them only as deleted in db.
#or something

versioned :dependent => :tracking
attr_accessible :updated_by

validates_presence_of :Omistaja
validates_presence_of :RekPvm
validates_presence_of :Nimi
validates_presence_of :tyyppi
validates_presence_of :RekNro
validates_presence_of :ValmMalli
validates_presence_of :Pituus
validates_presence_of :Leveys
validates_presence_of :Syvyys
validates_presence_of :Vuosimalli
validates_presence_of :JnoOm

validates_numericality_of :Pituus, :greater_than => 0
validates_numericality_of :Leveys, :greater_than => 0
validates_numericality_of :Syvyys
validates_numericality_of :Korkeus, :greater_than => 0
validates_numericality_of :Vuosimalli, :only_integer => true

has_many :BoatsMembers
has_many :members, :through => :BoatsMembers
 attr_accessible :members, :Huomautukset, :JnoOm, :JnoOs, :Katsastus, :Korkeus, :Laituri, :Leveys, :MuutosPvm, :Nimi, :Omistaja, :Pituus, :RekNro, :RekPvm, :Syvyys, :Tarra, :Teho, :Telakka, :Uppouma, :ValmMalli, :VenePuhA, :VenePuhB, :Vuosimalli, :tyyppi, :tag_attributes
end




# Boat.create(:Omistaja => "Jaakko", :RekPvm => "25.06.2005", :Nimi => "veneXYZ", :tyyppi => "turbovene", :RekNro => "051277", :ValmMalli => "vv-xx", :Pituus => "150.0", :Leveys => "100.0", :Syvyys => "50.0", :Vuosimalli => "1995")
