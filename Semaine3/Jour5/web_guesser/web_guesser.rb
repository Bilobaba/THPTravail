require 'sinatra'
require 'sinatra/reloader'


# http://localhost:4567/

number_x = rand (100)

get '/' do
  erb :index, :locals => {:number => number_x}
end


