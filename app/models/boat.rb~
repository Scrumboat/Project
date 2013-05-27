class Boat < ActiveRecord::Base
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

has_and_belongs_to_many :members
 attr_accessible :Huomautukset, :JnoOm, :JnoOs, :Katsastus, :Korkeus, :Laituri, :Leveys, :MuutosPvm, :Nimi, :Omistaja, :Pituus, :RekNro, :RekPvm, :Syvyys, :Tarra, :Teho, :Telakka, :Uppouma, :ValmMalli, :VenePuhA, :VenePuhB, :Vuosimalli, :tyyppi
end
