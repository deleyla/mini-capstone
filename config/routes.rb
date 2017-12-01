Rails.application.routes.draw do
  get '/all_products' => 'products#all_products'
end
