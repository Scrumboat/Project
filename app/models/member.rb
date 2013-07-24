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
has_many :invoices

attr_accessible :boats, :Ammatti, :Avain, :EmailFax, :Huom, :JK, :Jno, :KotiPuh, :Laivuri, :Liittynyt, :Lisenssi, :Maa, :MatkaPuh, :MuutosPvm, :Nimi, :Osoite, :Posti, :Sotu, :Toimi, :TyoPuh, :Varasto, :deleted, :deleted_at, :VeneRekNro


def self.search(search)
  if search
    param_string = search.to_s
    param_int    = search.to_i rescue param_int = nil
    find(:all, :conditions => ['"Nimi" LIKE ? OR lower("Nimi") LIKE ? OR "Jno" = ?', "%#{param_string}%", "%#{param_string}%", param_int])
  else
    find(:all)
  end
end


end
