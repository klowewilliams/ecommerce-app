Rails.application.routes.draw do
  get "/products" => 'products#index'
  get "/" => 'products#index'
  get "/pistachios" => 'products#pistachios'
  get "/almonds" => 'products#almonds'
  get "/walnuts" => 'products#walnuts'
  get "/cashews" => 'products#cashews'
end
