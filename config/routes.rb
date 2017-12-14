Rails.application.routes.draw do
  get '/all_products' => 'products#all_products'
  get '/show-the-product' => 'products#show'
  get '/one-of-the-products/:id' => 'products#segment'
  # shows all the products
  get '/products' => 'products#index'
  # show action, one particular product, needs id wildcard to find in db
  get '/products/:id' => 'products#show'
  # create action, make a new product, doesn't need an id wildcard because it hasn't been made yet
  post '/products' => 'products#create'
  # update a specific product
  patch '/products/:id' => 'products#update'
  # delete a specific product
  delete '/products/:id' => 'products#destroy'

  # show all the suppliers
  get '/suppliers' => 'suppliers#index'
end