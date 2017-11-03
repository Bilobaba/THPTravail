Rails.application.routes.draw do


  root 'users#index'

  resources :users,  only: [:show, :new, :create, :index]
  resources :events, only: [:show, :index, :new, :create, :subscribe ]
  get "/suscribe/:event/:user"   , to: "events#subscribe", as: 'subscribe'
  get "/unsuscribe/:event/:user"   , to: "events#unsubscribe", as: 'unsubscribe'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
