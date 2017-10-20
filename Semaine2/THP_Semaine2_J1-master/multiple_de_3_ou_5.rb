les_multiples = []
la_somme = 0
puts "Entrez la valeur max :"
nombre_max = gets.chomp.to_i
for num in 1..(nombre_max-1)
    if( (num%3)==0 || (num%5==0))
        les_multiples = les_multiples << num
        puts "Valeur gardée : ",num
    end
end

les_multiples.each do |valeur|
  la_somme = la_somme + valeur
end

puts "La somme des multiple de 3 ou 5 en dessous de 1000 est :",la_somme
