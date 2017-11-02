# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Debut"

Doctor.create(first_name: "Kevin", last_name: "Arnoult", postal_code: 94120)
Doctor.create(first_name: "Juliette", last_name: "Auvray", postal_code: 94120)
Doctor.create(first_name: "Alex", last_name: "Auffray", postal_code: 94120)
Doctor.create(first_name: "Duy", last_name: "Dang", postal_code: 94120)

Patient.create(first_name: "Brice", last_name: "Labejof")
Patient.create(first_name: "Naula", last_name: "Gratiant")

Specialty.create(name: "Chirurgie")
Specialty.create(name: "Dentiste")
Specialty.create(name: "Generaliste")


puts "Fin"

d = Doctor.first
dd = Doctor.second
ddd = Doctor.third

 p = Patient.first
 pp = Patient;second
 ppp = Patient.third

 s = Specialty.first
 ss = Specialty.second
 sss = Specialty.third
