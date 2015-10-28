Rails.application.routes.draw do
  root "pages#index"

  resources :sessions, only: [:show]
  get "logout" => "sessions#destroy"
  get '/auth/:provider/callback', to: "sessions#create"
  get '/auth/facebook', to: "sessions#create"

  resources :flights, only: [:create]
  get "/loggedin" => "flights#loggedin", as: :log
  get "/index" => "flights#index", as: :index
  post "search" => "flights#show"

  resource :bookings, only: [:show, :edit, :update, :destroy]
  get "book" => "bookings#new"
  post "to_booking" => "bookings#create"
  get "my_bookings" => "bookings#index"
  # get "bookings" => "bookings#index"

end