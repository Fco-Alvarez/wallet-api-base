Rails.application.routes.draw do
  scope '(:locale)', locale: /es|en/ do
    resources :users
    post '/auth/login', to: 'authentication#login'
    post '/auth/register',  to: 'authentication#register'
    resources :transactions, only: %i[index create]
  end
end
