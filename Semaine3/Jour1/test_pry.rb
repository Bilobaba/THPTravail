require 'pry'

class UneClasse
  attr_accessor :name_public
  :name_private

end

objet = UneClasse.new()
puts "ici 1"
binding.pry
puts "ici 2"
