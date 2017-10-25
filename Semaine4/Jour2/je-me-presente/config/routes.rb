Rails.application.routes.draw do

  root "static_pages#home"

  get '/home' , to: "static_pages#home"

  get '/contact', to: "static_pages#contact"

  get '/about/duy', to: "static_pages#duy", as: "duy"

  get '/about/kevin', to: "static_pages#kevin", as: "kevin"

  get '/about(/:name)(/:titre)', to: "static_pages#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
