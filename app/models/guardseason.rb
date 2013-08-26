class Guardseason < ActiveRecord::Base
  has_many :guardturns
  attr_accessible :alku_pvm, :guardturn_id, :loppu_pvm, :nimi
end
