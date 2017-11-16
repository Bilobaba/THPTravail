Rails.application.routes.draw do
  get 'pages/home'

  get 'pages/checkr'

  get 'pages/flynn'

  get 'pages/sparks'

  root 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
