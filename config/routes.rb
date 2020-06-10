Rails.application.routes.draw do
  # root 'sessions#home'
  # get '/users/user_id' => 'users#show'
  resources :categories 
  get '/' => 'sessions#home' 
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/logout' => 'sessions#destroy'

  get '/search' => 'reviews#reviewbycat'
  resources :reviews
  resources :places
  resources :users
  # resources :sessions
  #omniauth callback
  get '/auth/:provider/callback' => 'sessions#fbcreate'
  
  # post '/signup' => 'users#create' 
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.resources :reviews
  resources :places do
    resources :reviews, only: [:new, :index, :create]
  end
  resources :users, only: [:show, :create]
end


