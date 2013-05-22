class Member < ActiveRecord::Base
validates_presence_of :Nimi
validates_presence_of :Jno
validates_presence_of :Sotu
validates_presence_of :Liittynyt
validates_presence_of :JK
validates_presence_of :Osoite
validates_presence_of :Posti
validates_presence_of :MatkaPuh

has_and_belongs_to_many :boats
 attr_accessible :Ammatti, :Avain, :EmailFax, :Huom, :JK, :Jno, :KotiPuh, :Laivuri, :Liittynyt, :Lisenssi, :Maa, :MatkaPuh, :MuutosPvm, :Nimi, :Osoite, :Posti, :Sotu, :Toimi, :TyoPuh, :Varasto
end
