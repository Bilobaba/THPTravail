require 'pry'

class HomeController < ApplicationController

  def index
  end

  def private
  end

  def home
    binding.pry
    if  params.key?(:q)

    else
      redirect_to gossips_path
    end
  end
end
