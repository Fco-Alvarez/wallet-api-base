Rails.application.routes.draw do
  scope '(:locale)', locale: /es|en/ do
    namespace :api do
      namespace :v1, defaults: { format: 'json' } do
        resources :users
        get '/balance', to: "users#balance"
        post '/auth/login', to: 'authentication#login'
        post '/auth/register',  to: 'authentication#register'
        resources :transactions, only: %i[index create show]
      end
    end
  end
end
