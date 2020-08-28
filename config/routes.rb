Rails.application.routes.draw do

  devise_for :users
  resources :articles do 
    resources :comments 
  end
  
  root 'home#index'
  
  get "users/sign_up"
  get '/articles', to: 'articles#index'
  get '/:tag', to: 'articles#index', as: :tag
end
