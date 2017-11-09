require 'pry'


class FlightsController < ApplicationController
  def index
    @flights = Flight.all

    @airport_options = Airport.all.map{ |a| a.code }
    @departure_airport = false
    @arrival_airport = false

    #binding.pry

    if !params.key?(:departure_airport) then return end

    #binding.pry

    @departure_airport = Airport.find_by(code: params[:departure_airport]).code
    @arrival_airport = Airport.find_by(code: params[:arrival_airport]).code

    #binding.pry
  end
end
