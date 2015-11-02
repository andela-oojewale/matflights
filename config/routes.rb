Rails.application.routes.draw do
  root "pages#index"

  get "logout" => "sessions#destroy"
  get '/auth/:provider/callback', to: "sessions#create"
  get '/auth/facebook', to: "sessions#create"

  get "flights/all" => "flights#index", as: :index
  get "flights/search" => "flights#search", as: :search

  resource :bookings, only: [:show]
  get "booking/make_booking" => "bookings#new", as: :book
  post "to_booking" => "bookings#create"
  get "dashboard" => "bookings#index", as: :dashboard
  get "cancel" => "bookings#destroy", as: :cancel
  post "reservation" => "bookings#get_reservation"
  get "booking/edit" => "bookings#edit", as: :edit
  match "bookings/update" => "bookings#update", via: [:get, :post], as: :update
  get "bookings/payment"

end