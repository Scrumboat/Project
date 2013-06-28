#encoding: utf-8

class Member < ActiveRecord::Base

versioned :dependent => :tracking
attr_accessible :updated_by

validates_presence_of :Nimi
validates :Jno, :presence => true, :uniqueness => true
validates_presence_of :Sotu
validates_presence_of :Liittynyt
validates_presence_of :JK
validates_presence_of :Osoite
validates_presence_of :Posti
validates_presence_of :MatkaPuh

validates :Nimi, :format => { :with =>  /^[\D]*$/, :message => "Ei numeroita" }

validates_numericality_of :Jno, :only_integer => true

has_many :BoatsMembers
has_many :storages
has_many :boats, :through => :BoatsMembers

attr_accessible :boats, :Ammatti, :Avain, :EmailFax, :Huom, :JK, :Jno, :KotiPuh, :Laivuri, :Liittynyt, :Lisenssi, :Maa, :MatkaPuh, :MuutosPvm, :Nimi, :Osoite, :Posti, :Sotu, :Toimi, :TyoPuh, :Varasto, :deleted, :deleted_at, :VeneRekNro


def self.search(search)
  if search
    find(:all, :conditions => ['"Nimi" LIKE ? OR "Jno" LIKE ?', "%#{search}%", "%#{search}%"])
  else
    find(:all)
  end
end


end
