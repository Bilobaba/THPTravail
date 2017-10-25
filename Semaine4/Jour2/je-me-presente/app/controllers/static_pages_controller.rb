require 'pry'

class StaticPagesController < ApplicationController
  def home
    @time = Time.new
  end

  def contact
  end


  def duy
  end

  def about
    @name = params[:name] ? params[:name].downcase : ""
    @titre = params[:titre]
# binding.pry

    case @name
    when "duy"
      @descriptif = " Le grande sage"
    when "kevin"
      @descriptif = " Le Lucky Luke du code"
    when "juliette"
      @descriptif = " La designeuse"
    when "brice"
      @descriptif = " Le data scientist"
    when "alex"
      @descriptif = " La future mariée"
    when "naula"
      @descriptif = " La bras cassé (snif snif)"
    else
      @descriptif = " On ne connait pas #{@name} ici"
    end
  end
end
