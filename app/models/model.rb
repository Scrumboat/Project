class Model < ActiveRecord::Base
  attr_accessible :korkeus, :leveys, :pituus, :syvyys, :uppouma, :valm_malli, :tyyppi

  #validates_numericality_of :korkeus, :only_integer => true
  #validates :korkeus, :numericality => { :greater_than => 0, :less_than_or_equal_to => 100 }

  #validates_numericality_of :leveys, :only_integer => true
  #validates :leveys, :numericality => { :greater_than => 0, :less_than_or_equal_to => 100 }

  #validates_numericality_of :pituus, :only_integer => true
  #validates :pituus, :numericality => { :greater_than => 0, :less_than_or_equal_to => 100 }

  #validates_numericality_of :syvyys, :only_integer => true
  #validates :syvyys, :numericality => { :greater_than => 0, :less_than_or_equal_to => 100 }

  #validates_numericality_of :uppouma, :only_integer => true
  #validates :uppouma, :numericality => { :greater_than => 0, :less_than_or_equal_to => 100 }

  validates_presence_of :valm_malli
end