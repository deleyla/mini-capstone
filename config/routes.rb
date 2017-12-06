Rails.application.routes.draw do
  get '/all_products' => 'products#all_products'
  get '/show-the-product' => 'products#show'
  get '/one-of-the-products/:id' => 'products#segment'
  get '/products' => 'products#index'
  get '/products/:id' => 'products#show'
end