require 'pry'

class MovieController < ApplicationController

  def search

    if params.key?(:search)
      @movies = MovieSearcher.new(params[:search]).perform
      @configuration = Tmdb::Configuration.new
      @base_url = @configuration.base_url

      # binding.pry
    end
  end
end
