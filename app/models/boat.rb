#encoding utf-8

class Boat < ActiveRecord::Base

#dependent->tracking tracks DESTROYs and marks them only as deleted in db.
#or something
before_save :check_dock_and_berth
before_update :check_dock_and_berth
before_destroy :remove_reknro_from_berth
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

def check_dock_and_berth
    if is_number?(self.Laituri) && is_number?(self.Laituripaikka)
      if Dock.exists?(self.Laituri)
        @dock = Dock.find(self.Laituri)
        if Berth.exists?(:dock_id => @dock.id, :number => self.Laituripaikka)
          @berth = Berth.where(:dock_id => @dock.id, :number => self.Laituripaikka).first
          if check_if_it_fit
            @berth.Reknro = self.RekNro
            @berth.save
          else
            set_dock_and_bert_empty
          end
        else
          set_dock_and_bert_empty
        end
      else
        set_dock_and_bert_empty
      end
    end
end

def is_number?(object)
  true if Integer(object) rescue false
end
def set_dock_and_bert_empty
  self.Laituri = ""
  self.Laituripaikka = ""
end
def check_if_it_fit
  true if BigDecimal(self.Pituus.to_s) <= BigDecimal(@berth.length.to_s) && BigDecimal(self.Leveys.to_s) <= BigDecimal(@berth.width.to_s) && BigDecimal(self.Syvyys.to_s) <=      BigDecimal(@berth.depth.to_s)
end
def remove_reknro_from_berth
  if is_number?(self.Laituri) && is_number?(self.Laituripaikka)
    @dock = Dock.find(self.Laituri)
    @berth = Berth.where(:dock_id => @dock.id, :number => self.Laituripaikka).first
    @berth.Reknro = ""
    @berth.save
  end
end
end
