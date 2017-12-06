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

  def show
    # THIS IS A QUERY PARAMETER
    # in the url: http://localhost:3000/show-the-product/?name=orange%20resin%20earrings
    # will show the information for orange resin earrings
    # With a query parameter, you have to input the key value in the url, it is case sensitive. i.e. /?name=orange resin earrings
    # This is not the most practical way of doing things for the user experience
    # get some user input from my params hash
    the_product_name = params['name']
    product = Product.find_by(name: the_product_name)
    render json: product.as_json
  end

  def segment
    # THIS IS A SEGMENT PARAMETER
    # get some user input the key in the params hash
    # use that info to grab something from the db
    the_id = params['id']
    product = Product.find_by(id: the_id)
    render json: product.as_json
  end

  def index
    # get all products from my db
    products = Product.all
    # show the user all the products in my db
    render json: products.as_json
  end

end
