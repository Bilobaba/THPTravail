class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movies = []
    @movies << Movie.find(params[:movie])
    render "index"
  end

end
