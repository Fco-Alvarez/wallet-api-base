Rails.application.routes.draw do
  resources :transactions, only: [:create]
  # resource :users, only: [:create]
  # post "/login", to: "users#login"
  # get "/auto_login", to: "users#auto_login"
  resources :users
  post '/auth/login', to: 'authentication#login'
  post '/auth/register',  to: 'authentication#register'
end
