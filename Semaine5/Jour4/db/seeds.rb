# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Debut"
Doctor.create(first_name: "Kevin", last_name: "Arnoult", specialty: "Ophtalmo", postal_code: 94120)
Doctor.create(first_name: "Juliette", last_name: "Auvray", specialty: "Tabacologue", postal_code: 94120)
Doctor.create(first_name: "Alex", last_name: "Auffray", specialty: "Sport", postal_code: 94120)
Doctor.create(first_name: "Duy", last_name: "Dang", specialty: "Psycho", postal_code: 94120)

Patient.create(first_name: "Brice", last_name: "Labejof")
Patient.create(first_name: "Naula", last_name: "Gratiant")

puts "Fin"
