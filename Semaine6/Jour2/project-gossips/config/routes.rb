Rails.application.routes.draw do
  resources :gossips
  devise_for :moussaillons

  root "gossips#index"

  get 'home/index'

  get 'home/private'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
