Rails.application.routes.draw do
  root "flights#home"

  resources :sessions, only: [:destroy, :show]
  get "logout" => "sessions#destroy"
  get '/auth/:provider/callback', to: "sessions#create"
  get '/auth/facebook', to: "sessions#create"
  post "search" => "flights#search_flight"

  resources :flights, only: [:create]
  get "/loggedin" => "flights#loggedin", as: :log
  get "/index" => "flights#index", as: :index

  resource :bookings, only: [:show, :edit, :update, :destroy]
  get "/book" => "bookings#new"
  post "/to_booking" => "bookings#create"

end
