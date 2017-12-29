class CartedProductsController < ApplicationController
  # before_action :authenticate_user

  def index
    #Make a CartedProducts index action. Note that this shouldn’t show ALL the carted products - it should only show the current user’s carted products that have a status of “carted”!
    carted_products = CartedProduct.where(user_id: current_user.id).where(status: "carted")
    render json: carted_products.as_json
  end


  def create
    #Make a CartedProducts create action. Assume the user is sending the product id and quantity as parameters.
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
      )
    # save the information from user input to create a new carted_product
    # carted_product.save

    #happy path
    if carted_product.save
      render json: carted_product.as_json
    #sad path
    else
      render json: {errors: carted_product.errors.full_messages}
    end
  end
end
