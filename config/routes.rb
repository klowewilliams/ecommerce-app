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
  
  get "/carted_products" => 'carted_products#index'
  post "/carted_products" => 'carted_products#create'
  delete "/carted_products/:id" => 'carted_products#destroy'

  get "/suppliers" => 'suppliers#index'
  get "/suppliers/new" => 'suppliers#new'
  get "/suppliers/:id" => 'suppliers#show', as: :supplier
  post "/suppliers" => 'suppliers#create'
  get "/suppliers/:id/edit" => 'suppliers#edit' 
  patch "/suppliers/:id" => 'suppliers#update'
  delete "/suppliers/:id" => 'suppliers#destroy'

end
