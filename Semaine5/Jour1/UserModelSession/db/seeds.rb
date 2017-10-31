# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Debut"
User.delete_all
@user = User.create!(pseudo: 'DragonVert', email: 'dragonvert@gamil.com', password: 'foobar')
@user = User.create!(pseudo: 'Tartempion', email: 'tartelette@cuisine.com' , password: 'foobar')
@user = User.create!(pseudo: 'Phenix2', email: 'phenixrouge@ciel.com' , password: 'foobar')
@user = User.create!(pseudo: 'DragonVert', email: 'dragonvert2@gamil.com', password: 'foobar')
@user = User.create!(pseudo: 'Tartempion2', email: 'tartelette2@cuisine.com' , password: 'foobar')
@user = User.create!(pseudo: 'Phenix2', email: 'PheniXrouge2@ciel.com' , password: 'foobar')
puts "fin"
