# enconding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'CREATING DOCKS: 1, 2'
Dock.create([{ length: 30}, {length: 40}])

puts 'CREATING BERTHS: 1, 2'
Berth.create([{ id: 1, number: 1, length: 5.5, width: 2.4, depth: 1.6, exists: true, dock_id: 1},
			{ id: 2, number: 2, length: 3, width: 5.5, depth: 2.4, exists: false, dock_id: 2}])

puts 'DEFAULT ADMIN'
user = Admin.find_or_create_by_email :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup


