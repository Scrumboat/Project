#encoding: utf-8

class Member < ActiveRecord::Base

versioned :dependent => :tracking
attr_accessible :updated_by

validates_presence_of :nimi
validates :jno, :presence => true, :uniqueness => true, length: {maximum: 5}, :numericality => { :greater_than_or_equal_to => 1 }
#validates :matka_puh, :numericality => { :greater_than_or_equal_to => 1 }
validates_presence_of :sotu
validates_presence_of :liittynyt
validates_presence_of :jasentyyppi
validates_presence_of :osoite
validates_presence_of :posti
validates_presence_of :matka_puh

validates :nimi, :format => { :with =>  /^[\D]*$/, :message => "Ei numeroita" }

validates_numericality_of :jno, :only_integer => true

has_many :BoatsMembers
has_many :storages
has_many :boats, :through => :BoatsMembers
has_many :invoices

attr_accessible :boats, :ammatti, :avain, :email_fax, :huom, :jasentyyppi, :jno, :koti_puh, :laivuri, :liittynyt, :lisenssi, :maa, :matka_puh, :muutos_pvm, :nimi, :osoite, :posti, :sotu, :toimi, :tyo_puh, :varasto, :deleted, :deleted_at, :viitenumero, :special_billing

JASENTYYPIT = {'Aikuisjäsen' => 'aikuisjasen', 'Ainaisjäsen' => 'ainaisjasen', 'Puolisojäsen' => 'puolisojasen', 'Nuorisojäsen' => 'nuorisojasen', 'Kunniajäsen' => 'kunniajasen', 'Kutsujäsen' => 'kutsujasen'}

def self.search(search)
  if search
    param_string = search.to_s
    param_int    = search.to_i rescue param_int = nil
    find(:all, :conditions => ['"nimi" LIKE ? OR lower("nimi") LIKE ? OR "jno" = ?', "%#{param_string}%", "%#{param_string}%", param_int])
  else
    find(:all)
  end
end

  scope :is_deleted, -> { where(deleted: true) }
  scope :active, -> { where(deleted: false) }

def naytaJnoJaNimi
  #jasen = find(:first, :conditions => ['"jno" LIKE ?', self.jno]
  "#{self.jno} / #{self.nimi}"
end

end
