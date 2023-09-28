Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :users

  # get "/users", to: "users#index"
  # post "/users", to: "users#create"
  # get "/users/:id", to: "users#show", as: "user"
  # get "/users/:id/edit", to: "users#edit", as: "edit_user"
  # get "/users/new", to: "users#new", as: "new_user"
  # patch "/users/:id", to: "users#update"
  # put "/users/:id", to: "users#update"
  # delete "/users/:id", to: "users#destroy"
  resources :users do 
    resources :artworks, only:[:index]
    resources :comments, only:[:index]
  end
  resources :artworks do
    resources :comments, only:[:index]
  end
  resources :users, only: [:index, :show, :update, :destroy, :create]
  resources :artworks, only: [:index, :show, :update, :destroy, :create]
  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
end
