class MovieSeacher
  def login
    Tmdb::Api.key("e007eba5e2aa2b52cc8bf697ecd2798e")
    Tmdb::Api.language("fr")
    p Tmdb::Movie.find("batman")
  end
  def coucou
    p "coucou"
  end
end
