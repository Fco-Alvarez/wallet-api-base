Rails.application.routes.draw do
  resources :transactions, only: [:create, :show, :update]
  resources :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
end
