Rails.application.routes.draw do
  get 'pages/home', as: 'home'

  resources :tasks

  root to: 'tasks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
