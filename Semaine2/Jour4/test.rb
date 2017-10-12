# test recursive

def recursive(number)
  if number == 0
    puts "Ca se termine ici"
    return
  else
    number = number - 1
    puts "Number : ", number
    recursive(number)
  end
end

puts "Ca demarre a 10"
recursive(10)
puts "C'est fini"
