Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  get "/products" => 'products#index'
  get "/pistachios" => 'products#pistachios'
  get "/almonds" => 'products#almonds'
  get "/walnuts" => 'products#walnuts'
  get "/cashews" => 'products#cashews'
  get "/products/new" => 'products#new'
  get "/products/:id" => 'products#show'
  post "/products" => 'products#create'
  get "products/:id/edit" => 'products#edit'
  patch "products/:id" => 'products#update'
  delete "/products/:id" => 'products#destroy'
  post "/search" => 'products#search'
  post "/orders" => 'orders#create'
  get "/orders/:id" => 'orders#show'
end
