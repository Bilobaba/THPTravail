# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Debut"

User.destroy_all
Event.destroy_all

ud = User.create(name: "Duy")
ua = User.create(name: "Alex")
uj = User.create(name: "Juliette")
uk = User.create(name: "Kevin")

ew = Event.create(description: "Grosse fête du week-end", creator_id: ud.id, date: DateTime.new(2017,11,7,8,10), place: "Paris")
en = Event.create(description: "Noel", creator_id: ud.id, date: DateTime.new(2017,12,24,20,30), place: "Marseille")
ea = Event.create(description: "Anniversaire", creator_id: ud.id, date: DateTime.new(2017,12,26,8,00), place: "Paris")
ej = Event.create(description: "Jour de l an", creator_id: ua.id, date: DateTime.new(2018,1,1,0,0), place: "Nogent")

ud = User.find_by(name: "Duy")
ua = User.find_by(name: "Alex")
uj = User.find_by(name: "Juliette")
uk = User.find_by(name: "Kevin")

ew = Event.find_by(description: "Grosse fête du week-end")
en = Event.find_by(description: "Noel")
ea = Event.find_by(description: "Anniversaire")
ej = Event.find_by(description: "Jour de l an")

puts "Fin"
