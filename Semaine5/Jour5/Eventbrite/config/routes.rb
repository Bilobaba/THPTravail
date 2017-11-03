Rails.application.routes.draw do


  root 'users#index'

  resources :users,  only: [:show, :new, :create, :index]
  resources :events, only: [:show, :index, :new, :create, :subscribe ]
  get "/suscribe/:event/:user"   , to: "events#suscribe", as: 'suscribe'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
