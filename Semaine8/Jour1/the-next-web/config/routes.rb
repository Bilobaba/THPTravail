Rails.application.routes.draw do
  get 'home/index'

  get 'home/home'

  root 'home#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
