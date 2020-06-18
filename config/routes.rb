Rails.application.routes.draw do
  
  get '/' => 'sessions#home' 
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/logout' => 'sessions#destroy'

  get '/search' => 'reviews#reviewbycat'
  resources :reviews, only: [:new, :index, :create]
  resources :places, only: [:new, :index, :create, :update, :show, :edit]
  resources :categories, only: [:index] 
  resources :users, only: [:show, :create, :index, :new]
     
  # resources :sessions
  #omniauth callback
  get '/auth/:provider/callback' => 'sessions#fbcreate'
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.resources :reviews
  resources :places do
    resources :reviews, only: [:new, :index, :create]
  end
end

