Rails.application.routes.draw do
  get '/all_products' => 'products#all_products'
  get '/show-the-product' => 'products#show'
  get '/one-of-the-products/:id' => 'products#segment'
  # shows all the products
  get '/products' => 'products#index'
  # show action, one particular product, needs id wildcard to find in db
  get '/products/:id' => 'products#show'
  # create action, make a new product, doesn't need an id wildcard because it hasn't been make yet
  post '/products' => 'products#create'
end