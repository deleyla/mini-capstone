class ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]


  def index
    # get all products from my db
    # products = Product.all

    #filter by search term and by price
    if params[:sort_by_price] == 'true'
      the_sort_attribute = :price
    else 
      the_sort_attribute = :id
    end

    # Change the index action to allow for searching by name.
    the_search_term = params[:search_term]
    # Change the index action to always return products sorted by id.
    products = Product.where("name LIKE?", "%#{the_search_term}%").order(the_sort_attribute)

    # category = Category.find_by(id: params[:category_id_input])
    # products = category.products

    # show the user all the products in my db
    render json: products.as_json
  end

  def show
    # grab a single product from the db
    # product = Product.first

    #go to params hash and get the id
    # the_id = params['id']

    # grab a single product based on the id
    product = Product.find_by(id: params[:id])

    # show a particular product
    render json: product.as_json
  end

  def create
    # check if someone is an admin
    # if they are, let them create a product
    # if they are not, do not let them create a product
    # make a new instance of product and save it to the database
    # framework of information needed to create a new product
    product = Product.new(
      name: params[:name],
      price: params[:price],
      # image: params['image'],
      description: params[:description],
      availability: params[:availability]
      )
    # save the information from user input to create a new product
    product.save

    #happy path
    if product.save
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
    if product.update(
      name: params[:name],
      price: params[:price],
      # image: params['image'],
      description: params[:description],
      availability: params[:availability]
    )
      render json: product.as_json
    else
      render json: {errors: product.errors.full_messages}
    end
  end

  def destroy
    #find a particular product in my db
    the_id = params['id']
    product = Product.find_by(the_id)
    #destroy the selected product
    product.destroy
    render json: {message: "You deleted the product"}
  end
end