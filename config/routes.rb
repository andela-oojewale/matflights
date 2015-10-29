Rails.application.routes.draw do
  root "pages#index"

  resources :sessions, only: [:show]
  get "logout" => "sessions#destroy"
  get '/auth/:provider/callback', to: "sessions#create"
  get '/auth/facebook', to: "sessions#create"

  resources :flights, only: [:show]
  get "loggedin" => "flights#loggedin", as: :log
  get "index" => "flights#index", as: :index
  get "search" => "flights#search"

  resource :bookings, only: [:show]
  get "book" => "bookings#new"
  post "to_booking" => "bookings#create"
  get "my_bookings" => "bookings#index"
  get "cancel" => "bookings#destroy"
  post "reservation" => "bookings#get_reservation"
  get "edit" => "bookings#edit"
  match "update" => "bookings#update", via: [:get, :post]
  get "bookings/payment"


end