class ProductsController < ApplicationController

  def index
    # get all products from my db
    # products = Product.all
    # Change the index action to allow for searching by name.
    the_search_term = params[:search_term]
    # Change the index action to always return products sorted by id.
    products = Product.all.order(:id => :asc).where("name LIKE ?","%#{the_search_term}%") 

    # show the user all the products in my db
    render json: products.as_json
  end

  def show
    # grab a single product from the db
    # product = Product.first

    #go to params hash and get the id
    the_id = params['id']

    # grab a single product based on the id
    product = Product.find_by(id: the_id)

    # show a particular product
    render json: product.as_json
  end

  def create
    # framework of information needed to create a new product
    product = Product.new(
      name: params['name'],
      price: params['price'],
      image: params['image'],
      description: params['description']
      )
    # save the information from user input to create a new product
    product.save

    #happy path
    if contact.save
      render json: product.as_json
    #sad path
    else
      render json: {errors: product.errors.full_messages}
    end
  end

  def update
    # go to params hash and get the id
    the_id = params['id']

    # grab a single product based on the id
    product = Product.find_by(id: the_id)

    # update it
    product.name = params['name'] || product.name
    product.price = params['price'] || product.price
    product.description = params['description'] || product.description
    # save the information from user input to create a new product
    product.save
    # print the information as json
    render json: product.as_json
  end

  def destroy
    #find a particular product in my db
    the_id = params['id']
    product = Product.find_by(id: the_id)
    #destroy the selected product
    product.destroy
    render json: {message: "You deleted the product"}
  end

  # def all_products
  #   #grab all products from the database
  #   products = Product.all
  #   product_hashes = []

  #   #show the products to the user
  #   i = 0
  #   products.length.times do
  #     #take each product and convert it into a hash
  #     products[i]
  #     the_product = {
  #       name: products[i].name,
  #       price: products[i].price,
  #       image: products[i].image,
  #       description: products[i].description
  #     }
  #     product_hashes << the_product
  #     i += 1
  #   end
  #   render json: product_hashes
  # end

  # def show
  #   # THIS IS A QUERY PARAMETER
  #   # in the url: http://localhost:3000/show-the-product/?name=orange%20resin%20earrings
  #   # will show the information for orange resin earrings
  #   # With a query parameter, you have to input the key value in the url, it is case sensitive. i.e. /?name=orange resin earrings
  #   # This is not the most practical way of doing things for the user experience
  #   # get some user input from my params hash
  #   the_product_name = params['name']
  #   product = Product.find_by(name: the_product_name)
  #   render json: product.as_json
  # end

  # def segment
  #   # THIS IS A SEGMENT PARAMETER
  #   # get some user input the key in the params hash
  #   # use that info to grab something from the db
  #   the_id = params['id']
  #   product = Product.find_by(id: the_id)
  #   render json: product.as_json
  # end

end
