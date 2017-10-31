require 'pry'

class StaticPagesController < ApplicationController
  def home
    p @current_user
    binding.pry
  end

  def reponse
    if !logged_in?
      flash[:warning] = "Il faut se connecter avant"
      redirect_to :back
    end
  end
end
