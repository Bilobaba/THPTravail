Rails.application.routes.draw do
  resources :jobs
  root 'jobs#index'
  get '/job', to: 'jobs#job_puts'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
