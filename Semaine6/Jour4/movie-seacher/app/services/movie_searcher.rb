require 'pry'
require 'themoviedb'

class MovieSearcher

  def initialize(string)
    @string = string
    login
  end

  def perform
    Tmdb::Movie.find(@string)
  end

  def login
    Tmdb::Api.key("e007eba5e2aa2b52cc8bf697ecd2798e")
    Tmdb::Api.language("fr")
  end
end
