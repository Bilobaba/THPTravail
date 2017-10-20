def trader_du_dimanche(table)

  benefice = 0
  date_achat = -1
  date_vente = -1

  puts table

  # jour d'achat
  for i in(0..(table.length-1))

    # jour de vente
    for j in (i+1..table.length-1)

      puts " i: ",i
      puts "j : ",j

      if benefice < (table[j] - table[i])

        benefice =  (table[j] - table[i])
        date_achat = i
        date_vente = j
      end
    end
  end

  puts "[#{date_achat},#{date_vente}] \# $#{table[date_vente]} - $#{table[date_achat]} = $#{table[date_vente] - table[date_achat]} "
end

table = [17,3,6,9,15,8,6,1,10]
trader_du_dimanche(table)



