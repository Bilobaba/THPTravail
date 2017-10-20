require 'sinatra'
require 'sinatra/reloader'
require 'pry'


# http://localhost:4567/

$number_x = rand (100)

get '/' do
#  erb :index, :locals => {:number => $number_x}
#  throw params.inspect
  guess = params["guessy"]
#  binding.pry
  (message,style) = check_guess(guess.to_i)
#  binding.pry
  erb :index, :locals => {:number => $number_x, :message => message, :style => style}
end


def check_guess(guess)
  if guess == $number_x
    style =  " <style> body { background: red;} </style> "
    message = " $number_x : #{$number_x} " + "Bravo ! vous avez trouvé"
    return message,style
  elsif guess < $number_x
    style =  " <style> body { background: blue;} </style> "
    message = " $number_x : #{$number_x} " + "Trop petit, réessayez"
    return message,style
  else
    style =  " <style> body { background: green;} </style> "
    message = " $number_x : #{$number_x} " + "Trop grand, rééssayez"
    return message,style
  end
end


