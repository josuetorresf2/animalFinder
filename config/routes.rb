Rails.application.routes.draw do
  resources :animals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'animals/index'
  root to: "animals#index" 


  devise_for :users
  resources :users, :only => [:index]
  resources :users, :only => [:show]

  match '/users/index',     to: 'users#index',       via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'


  get "/animals", to: "animals#index" 
  
  #devise_for :users, :controllers => { registrations: 'users/registrations' }

  
  #devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  #get "/new_user_registration", to: "devise/registrations#new"
  
  get "map", to: "map#index"


end
