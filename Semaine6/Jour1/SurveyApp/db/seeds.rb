# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Debut"

Participant.destroy_all

pd = Participant.create(name: "Duy")
pk = Participant.create(name: "Kevin")
pj = Participant.create(name: "Juliette")
pa = Participant.create(name: "Alex")

Survey.destroy_all
sl = Survey.create(name: "Lieu")
sa = Survey.create(name: "Age")
ss = Survey.create(name: "Musique")
sf = Survey.create(name: "Film")

Question.destroy_all
q1 = Question.create(survey: sl, content: "Lieu de naissance")
q2 = Question.create(survey: sl, content: "Lieu d habitation")
q3 = Question.create(survey: sf, content: "Le meilleur film d action")
q4 = Question.create(survey: sf, content: "Le meilleur film societale")

Answer.destroy_all
a1 = Answer.create(question: q3, participant: pd, content: "Kung fu panda")
a2 = Answer.create(question: q4, participant: pd, content: "Fight club")
a3 = Answer.create(question: q1, participant: pk, content: "Bretagne")
a4 = Answer.create(question: q2, participant: pj, content: "Orléans")

puts "Fin"

