# enconding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'CREATING FEW MEMBERS'
Member.create([{ id: 1, jasentyyppi: 'puolisojasen', jno: 4421, matka_puh: "044-4443331", nimi: "Esa Esimerkki", osoite: "osoitetie 4",
                 posti: "00100 Helsinki", sotu: "010177-124M", liittynyt: "5-11-2005", viitenumero: "044215"},
               { id: 2, jasentyyppi: 'ainaisjasen', jno: 2149, matka_puh: "044-3334442", nimi: "Eero Engel", osoite: "Venepolku 85 c 35",
                 posti: "00500 Helsinki", sotu: "221166-031W", liittynyt: "1-6-1999", viitenumero: "021490"},
               { id: 3, jasentyyppi: 'kunniajasen', jno: 2222, matka_puh: "050-8497764", nimi: "Mauri Menomajava", osoite: "Patokuja 1",
                 posti: "99500 Kaukana", sotu: "091033-129K", liittynyt: "31-1-1940", viitenumero: "022224"},
               { id: 4, jasentyyppi: 'kutsujasen', jno: 12, matka_puh: "040-1234567", nimi: "Matti Meikalainen", osoite: "Jokutie 6",
                 posti: "10101 Jyvaskyla", sotu: "041055-52A", liittynyt: "15-04-2008", viitenumero: "000123", deleted: true}])

puts 'CREATING FEW BOATS'
Boat.create([{ id: 1, rek_pvm: "1-1-1990", nimi: "Jallu Kola", tyyppi: "S/S", reknro: "aaa-bbb", valm_malli: "xxx-1", pituus: 30,
               leveys: 3.5, syvyys: 2.1, vuosimalli: 1903, korkeus: 6.9 },
             { id: 2, rek_pvm: "3-11-2000", nimi: "Rommi Kola", tyyppi: "GTS", reknro: "ccc-ddd", valm_malli: "hoplaa", pituus: 50,
               leveys: 9, syvyys: 3.5, vuosimalli: 1949, korkeus: 9.1 },
             { id: 3, rek_pvm: "1-1-1990", nimi: "Kossu Kola", tyyppi: "NS", reknro: "eee-fff", valm_malli: "nuc", pituus: 10,
               leveys: 1.5, syvyys: 1.1, vuosimalli: 2014, korkeus: 2.5 },
             { id: 4, rek_pvm: "3-7-2010", nimi: "Tupla-Omistus", tyyppi: "soutuvene", reknro: "ggg-hhh", valm_malli: "Terhi", pituus: 2,
               leveys: 1, syvyys: 0.3, vuosimalli: 1986, korkeus: 0.4}])

puts 'ADDING BOATS TO MEMBERS RELATIONS'
BoatsMember.create([{ boat_id: 2, member_id: 1},
                    { boat_id: 1, member_id: 2},
                    { boat_id: 3, member_id: 3},
                    { boat_id: 4, member_id: 1},
                    { boat_id: 4, member_id: 3}])

puts 'CREATING DOCKS: 1, 2'
Dock.create([{name: 'a', length: 30}, {name: 'b', length: 40}])

puts 'CREATING BERTHS: 1, 2'
Berth.create([{ id: 1, number: 1, length: 11, width: 2.4, depth: 1.6, exists: true, dock_id: 1, boat_id: 1},
              { id: 2, number: 2, length: 31, width: 5.5, depth: 2.4, exists: false, dock_id: 2, boat_id: 2},
              { id: 3, number: 3, length: 5, width: 3, depth: 2.7, exists: true, dock_id: 1,  boat_id: 3},
              { id: 4, number: 4, length: 2, width: 4, depth: 5, exists: true, dock_id: 1, boat_id: 4},
              { id: 5, number: 5, length: 1, width: 1, depth: 1, exists: true, dock_id: 1},
              { id: 6, number: 6, length: 2, width: 2, depth: 2, exists: true, dock_id: 1},
              { id: 7, number: 7, length: 1.5, width: 1.5, depth: 1.5, exists: true, dock_id: 2},
              { id: 8, number: 8, length: 1.2, width: 2.2, depth: 2.1, exists: true, dock_id: 2},
              { id: 9, number: 9, length: 9, width: 3.5, depth: 3.2, exists: true, dock_id: 1}])


puts 'CREATING 2 DOCKYARDS'
Dockyard.create([{ id: 1, length: 100, width: 60, name: "T1A"},
                 { id: 2, length: 70, width: 40, name: "T2A"}])

puts 'CREATING DOCKYARD_SPOTS'
DockyardSpot.create([{id: 1, boat_length: 50, boat_width: 9, length: 50.8, width: 9.8, number: 1, dockyard_id: 1, boat_id: 2},
                     {id: 2, length: 7, width: 2, number: 2, dockyard_id: 1},
                     {id: 3, length: 3, width: 1.5, number: 1, dockyard_id: 2}])

puts 'CREATING PRICING'

Pricing.create([{target: "minLaituripaikanHinta", data: 50},
                {target: "karhumaksu", data: 20},
                {target: "veneenHinnanKasvu", data: 10},
                {target: "leveysLaituripaikanHinnanKasvuun", data: 0.25},
                {target: "telakanNeliohinta", data: 5},
                {target: "liittymismaksu", data: 100},
                {target: "jasenmaksu", data: 50},
                {target: "ensirekmaksu", data: 40},
                {target: "veneenvuosimaksu", data: 25},
                {target: "varastokoppinelio", data: 5}])

puts 'DEFAULT ADMIN (if we got ENV variables for it)'
if ENV['ADMIN_EMAIL'] && ENV['ADMIN_PASSWORD']
  user = Admin.find_or_create_by_email :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
end

puts 'CREATING INVOICES'
Invoice.create([{ member_id: 1, erapvm: '2012-01-01', jno: 4421, telakkamaksu: 300, summa: 300,maksettu: false, luontipvm: Time.now},
                { member_id: 1, erapvm: '2014-11-11', jno: 4421, liittymismaksu: 123, summa: 123, maksettu: false, luontipvm: Time.now},
                { member_id: 1, erapvm: '2014-04-01', jno: 4421, vartiosakko: 444, summa: 444, maksettu: false, luontipvm: Time.now},
                { member_id: 2, erapvm: '2014-01-05', jno: 2149, telakkamaksu: 55, summa: 55, maksettu: true, luontipvm: Time.now},
                { member_id: 2, erapvm: '2011-11-09', jno: 2149, vartiosakko: 200, summa: 200, maksettu: true, luontipvm: Time.now},
                { member_id: 3, erapvm: '2014-05-05', jno: 2222, varastokoppimaksu: 100, summa: 100, maksettu: true, luontipvm: Time.now}])
