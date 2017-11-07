# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or newd alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.new([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.new(name: 'Luke', movie: movies.first)

m1 = Moussaillon.new(email: "ddd.eee@gmail.com", anonymous_username: "ddd", password: "foobar")
m2 = Moussaillon.new(email: "sss.eee@gmail.com", anonymous_username: "sss", password: "foobar")
m3 = Moussaillon.new(email: "www.eee@gmail.com", anonymous_username: "www", password: "foobar")
m4 = Moussaillon.new(email: "xxx.eee@gmail.com", anonymous_username: "xxx", password: "foobar")
m5 = Moussaillon.new(email: "yyy.eee@gmail.com", anonymous_username: "yyy", password: "foobar")

m1.save
m2.save
m3.save
m4.save
m5.save


g1 = Gossip.new(moussaillon: m1, content: "Content 1")
g2 = Gossip.new(moussaillon: m2, content: "Content 2")
g3 = Gossip.new(moussaillon: m3, content: "Content 3")
g4 = Gossip.new(moussaillon: m1, content: "Content 4")
g5 = Gossip.new(moussaillon: m1, content: "Content 5")

g1.save
g2.save
g3.save
g4.save
g5.save

