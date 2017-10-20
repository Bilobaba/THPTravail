dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]

def jean_michel_data(chaine,dico)

  chaine.downcase!

  reponse = []
    dico.each do |mot|
#      puts "Mot à chercher ",mot
      nombre = compter_string_dans_string(chaine,mot)
      if nombre != 0
       reponse = reponse << {mot => nombre}
#       puts "Mot trouvé : ",mot
      else
#          puts "Mot NON trouvé ",mot
      end
#       puts "Nombre =", nombre
  end

  puts reponse
end

def compter_string_dans_string(grande_chaine,mot)
  nombre = 0
  chercher = true
  decalage = 0
  while (chercher)
    rang = grande_chaine.index(mot,decalage)
#    puts "Rang :",rang
#    gets
    if rang.nil?
      chercher = false
    else
      nombre+=1
      decalage = rang+1
    end
  end

  return nombre
end

puts "Pour below"
jean_michel_data("below", dictionary)
puts "Pour phrase longue"
jean_michel_data("Howdy partner, sit down! How's it going?", dictionary)
