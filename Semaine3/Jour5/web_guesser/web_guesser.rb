require 'sinatra'
require 'sinatra/reloader'
require 'pry'


# http://localhost:4567/

class Guess
  attr_accessor :number_hided, :style
  def check_guess(guess)

    if guess == @number_hided
      message = "<em class =\"style-win\"> Bravo ! Vous avez trouvé <em>"
      return message
    elsif guess < @number_hided
      message = "<em class ='style-low'> Trop petit, nouvelle chance : <em>"
      return message
    else
      message = "<em class ='style-high'> Trop grand, réessayez :  <em>"
      return message
    end
  end
end

guess_obj = Guess.new
guess_obj.number_hided = rand (100)

get '/' do
#  erb :index, :locals => {:number => $number_x}
#  throw params.inspect
  guess = params["guessy"]
#  binding.pry
  message = guess_obj.check_guess(guess.to_i)
#  binding.pry
  erb :index, :locals => {:message => message, :number => guess_obj.number_hided}
end




