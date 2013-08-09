class Model < ActiveRecord::Base
  attr_accessible :Korkeus, :Leveys, :Pituus, :Syvyys, :Uppouma, :ValmMalli, :tyyppi

  validates_numericality_of :Korkeus, :only_integer => true
  validates :Korkeus, :numericality => { :greater_than => 0, :less_than_or_equal_to => 100 }

  validates_numericality_of :Leveys, :only_integer => true
  validates :Leveys, :numericality => { :greater_than => 0, :less_than_or_equal_to => 100 }

  validates_numericality_of :Pituus, :only_integer => true
  validates :Pituus, :numericality => { :greater_than => 0, :less_than_or_equal_to => 100 }

  validates_numericality_of :Syvyys, :only_integer => true
  validates :Syvyys, :numericality => { :greater_than => 0, :less_than_or_equal_to => 100 }

  validates_numericality_of :Uppouma, :only_integer => true
  validates :Uppouma, :numericality => { :greater_than => 0, :less_than_or_equal_to => 100 }

  validates_presence_of :ValmMalli
end