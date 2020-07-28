Rails.application.routes.draw do
  resources :articles
  root 'home#index'

  get '/articles', to: 'articles#index'
end
