Rails.application.routes.draw do
  scope '(:locale)', locale: /es|en/ do
    namespace :api do
      namespace :v1, defaults: { format: 'json' } do
        resources :users
        get '/balance', to: 'users#balance'
        post '/auth/login', to: 'authentication#login'
        post '/auth/register',  to: 'authentication#register'
        resources :movements, only: %i[index create show] do
          post 'transfer', on: :collection
        end
        resources :accounts, only: %i[index]
      end
    end
  end
end
