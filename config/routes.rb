Rails.application.routes.draw do

  devise_for :users
  resources :articles
  
  root 'home#index'
  
  get "users/sign_up"
  get '/articles', to: 'articles#index'
end
