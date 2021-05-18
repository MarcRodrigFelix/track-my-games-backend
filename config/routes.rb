Rails.application.routes.draw do

  post '/login', to: 'sessions#login'
  post '/autologin', to: 'sessions#autologin'

  resources :users
  resources :games

end
