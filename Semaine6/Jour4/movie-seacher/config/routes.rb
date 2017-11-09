Rails.application.routes.draw do
  get 'movie/search'

  get '/movies', to: "movie#search"

  root "movie#search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
