class ProductsController < ApplicationController
  def all_products
    #grab all products from the database
    products = Product.all
    product_hashes = []

    #show the products to the user
    i = 0
    products.length.times do
      #take each product and convert it into a hash
      products[i]
      the_product = {
        name: products[i].name,
        price: products[i].price,
        image: products[i].image,
        description: products[i].description
      }
      product_hashes << the_product
      i += 1
    end
    render json: product_hashes
  end

end
