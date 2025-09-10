Rails.application.routes.draw do
  root "guests#index" 

  get "/signup", to: "users#new" 
  post "/users", to: "users#create" 
  
  get "/login", to: "sessions#new" 
  post "/login", to: "sessions#create"

  resources :guests, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :tables
end
