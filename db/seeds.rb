# enconding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'CREATING FEW MEMBERS'
Member.create([{ id: 1, JK: 'normaali', Jno: 4421, MatkaPuh: "044-4443331", Nimi: "Esa Esimerkki", Osoite: "Osoitetie 4",
                 Posti: "00100 Helsinki", Sotu: "010177-124M", Liittynyt: "5-11-2005"},
               { id: 2, JK: 'normaali', Jno: 2149, MatkaPuh: "044-3334442", Nimi: "Eero Engel", Osoite: "Venepolku 85 c 35",
                 Posti: "00500 Helsinki", Sotu: "221166-031W", Liittynyt: "1-6-1999"},
               { id: 3, JK: 'hiiohoi', Jno: 2222, MatkaPuh: "050-8497764", Nimi: "Mauri Menomajava", Osoite: "Patokuja 1",
                 Posti: "99500 Kaukana", Sotu: "091033-129K", Liittynyt: "31-1-1940"}])

puts 'CREATING FEW BOATS'
Boat.create([{ id: 1, RekPvm: "1-1-1990", Nimi: "Jallu Kola", tyyppi: "S/S", RekNro: "aaa-bbb", ValmMalli: "xxx-1", Pituus: 30,
               Leveys: 3.5, Syvyys: 2.1, Vuosimalli: 1903, Korkeus: 6.9 },
             { id: 2, RekPvm: "3-11-2000", Nimi: "Rommi Kola", tyyppi: "GTS", RekNro: "ccc-ddd", ValmMalli: "hoplaa", Pituus: 50,
               Leveys: 9, Syvyys: 3.5, Vuosimalli: 1949, Korkeus: 9.1 },
             { id: 3, RekPvm: "1-1-1990", Nimi: "Kossu Kola", tyyppi: "NS", RekNro: "eee-fff", ValmMalli: "nuc", Pituus: 10,
               Leveys: 1.5, Syvyys: 1.1, Vuosimalli: 2014, Korkeus: 2.5 },
             { id: 3, RekPvm: "3-7-2010", Nimi: "Tupla-Omistus", tyyppi: "soutuvene", RekNro: "ggg-hhh", ValmMalli: "Terhi", Pituus: 2,
               Leveys: 1, Syvyys: 0.3, Vuosimalli: 1986, Korkeus: 0.4}])

puts 'ADDING BOATS TO MEMBERS RELATIONS'
BoatsMember.create([{ boat_id: 2, member_id: 1},
                    { boat_id: 1, member_id: 2},
                    { boat_id: 3, member_id: 3},
                    { boat_id: 4, member_id: 1},
                    { boat_id: 4, member_id: 3}])

puts 'CREATING DOCKS: 1, 2'
Dock.create([{ length: 30}, {length: 40}])

puts 'CREATING BERTHS: 1, 2'
Berth.create([{ id: 1, number: 1, length: 11, width: 2.4, depth: 1.6, exists: true, dock_id: 1, Reknro: 'eee-fff'},
              { id: 2, number: 2, length: 31, width: 5.5, depth: 2.4, exists: false, dock_id: 2, Reknro: 'aaa-bbb'},
              { id: 3, number: 3, length: 9, width: 3.5, depth: 3.2, exists: true, dock_id: 1, Reknro: 'ccc-ddd'}])


puts 'CREATING 2 DOCKYARDS'
Dockyard.create([{ id: 1, length: 100, width: 60, name: "T1A"},
                 { id: 2, length: 70, width: 40, name: "T2A"}])

puts 'CREATING DOCKYARD_SPOTS'
DockyardSpot.create([{id: 1, boat_length: 50, boat_width: 9, length: 50.8, width: 9.8, number: 1, dockyard_id: 1, boat_id: 2},
                     {id: 2, length: 7, width: 2, number: 2, dockyard_id: 1},
                     {id: 3, length: 3, width: 1.5, number: 1, dockyard_id: 2}])

puts 'CREATING PRICING'
Pricing.create([{target: "minLaituripaikanHinta", data: 50}, {target: "veneenHinnanKasvu", data: 10}, {target: "leveysLaituripaikanHinnanKasvuun", data: 0.25}, {target: "telakanNeliohinta", data: 5}, {target: "liittymismaksu", data: 100}, {target: "jasenmaksu", data: 50}, {target: "ensirekmaksu", data: 40},{target: "veneenvuosimaksu", data: 25},{target: "varastokoppinelio", data: 5}])

puts 'DEFAULT ADMIN (if we got ENV variables for it)'
if !ENV['ADMIN_EMAIL'].nil? && !ENV['ADMIN_PASSWORD'].nil?
  user = Admin.find_or_create_by_email :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
end

puts 'CREATING INVOICES'
Invoice.create([{ member_id: 1, erapvm: '2012-1-1', vartiosakko: 300, maksettu: true},{ member_id: 1, erapvm: '2014-11-11', liittymismaksu: 123},{ member_id: 1, erapvm: '2011-04-01', vartiosakko: 444}])
