Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root to: 'lists#index'
  resources :lists, only: %i[index show new create] do
    resources :bookmarks, only: %i[new create]
  end
  resources :bookmarks, only: :destroy
  # get "lists", to: "lists#index"
  # get "lists/new", to: "lists#new", # as: :new_list
  # get "lists/:id", to: "lists#show"
  # post "lists", to: "lists#create"
  # get "lists/:id/bookmarks/new", to: "bookmarks#new" # ,  as :new_list_bookmark
  # post "lists/:list_id/bookmarks", to: "bookmarks#create"

  # Defines the root path route ("/")
  # root "posts#index"
end
