Rails.application.routes.draw do
  root 'home#index'

  get '/posts', to: 'posts#index'
end
