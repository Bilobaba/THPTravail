Rails.application.routes.draw do
  get 'flights/index', as: 'airports'
  get 'flights/show', to: 'flights#show', as:'flight'
  root "flights#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
