Rails.application.routes.draw do

  post '/login', to: 'sessions#login'
  post '/autologin', to: 'sessions#login'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'

  resources :users, only: [ :create, :show, :index ]
  resources :games, only: [ :create, :show, :index ]

end
