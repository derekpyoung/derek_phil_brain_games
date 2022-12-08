Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/users', to: "users#create"
  patch 'users/:id', to: "users#update"
  get '/users', to: "users#index"
  get '/users/:id', to: "users#show"

  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
 
end
