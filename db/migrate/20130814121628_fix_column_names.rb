

 class FixColumnNames < ActiveRecord::Migration
  def change
    change_table :members do |t|
      t.rename :Nimi, :nimi
      t.rename :Jno, :jno
      t.rename :Sotu, :sotu
      t.rename :Liittynyt, :liittynyt
      t.rename :MuutosPvm, :muutos_pvm
      t.rename :Toimi, :toimi
      t.rename :Lisenssi, :lisenssi
      t.rename :Osoite, :osoite
      t.rename :Posti, :posti
      t.rename :Maa, :maa
      t.rename :KotiPuh, :koti_puh
      t.rename :MatkaPuh, :matka_puh
      t.rename :TyoPuh, :tyo_puh
      t.rename :EmailFax, :email_fax
      t.rename :Ammatti, :ammatti
      t.rename :Laivuri, :laivuri
      t.rename :Huom, :huom
      t.rename :Varasto, :varasto
      t.rename :Avain, :avain
      t.rename :annetutHyvitykset, :annetut_hyvitykset
      t.rename :suorituksetIlmanViitetta, :suoritukset_ilman_viitetta
      t.rename :maksetunSummanPalautus, :maksetun_summan_palautus
      t.rename :edellisenKaudenLaskutus, :edellis_kauden_laskutus
    end

    rename_column :berths, :Reknro, :reknro

    change_table :boats do |t|
      t.rename :Huomautukset, :huomautukset
      t.rename :Katsastus, :katsastus
      t.rename :Korkeus, :korkeus
      t.rename :Leveys, :leveys
      t.rename :MuutosPvm, :muutos_pvm
      t.rename :Nimi, :nimi
      t.rename :Pituus, :pituus
      t.rename :RekNro, :reknro
      t.rename :RekPvm, :rek_pvm
      t.rename :Syvyys, :syvyys
      t.rename :Tarra, :tarra
      t.rename :Teho, :teho
      t.rename :Telakka, :telakka
      t.rename :Uppouma, :uppouma
      t.rename :ValmMalli, :valm_malli
      t.rename :VenePuhA, :vene_puh_a
      t.rename :VenePuhB, :vene_puh_b
      t.rename :Vuosimalli, :vuosimalli
    end

    change_table :invoices do |t|
      t.rename :suorituksetKassaan, :suoritukset_kassaan
    end

    change_table :models do |t|
      t.rename :Korkeus, :korkeus
      t.rename :Leveys, :leveys
      t.rename :Pituus, :pituus
      t.rename :Syvyys, :syvyys
      t.rename :Uppouma, :uppouma
      t.rename :ValmMalli, :valm_malli
    end
  end
end

