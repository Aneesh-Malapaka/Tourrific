Rails.application.routes.draw do
  
  # Defines the root path route ("/")
  root "sessions#home"
  # devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions' }  
 
 
  # user related 
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  
  resources :tour_companies
  #session routes
  # get '/login', to: 'sessions#login'
  # post '/login', to: 'sessions#create'
  # post '/logout', to: 'sessions#destroy'
  # get '/logout', to: 'sessions#destroy'

end
