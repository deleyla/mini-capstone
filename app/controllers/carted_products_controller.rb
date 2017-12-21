class CartedProductsController < ApplicationController
  def create
    cartedproduct = CartedProduct.new(
      user_id: params[:user_id],
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: params[:status],
      order_id: params[:order_id]
      )
    # save the information from user input to create a new cartedproduct
    cartedproduct.save

    #happy path
    if cartedproduct.save
      render json: cartedproduct.as_json
    #sad path
    else
      render json: {errors: cartedproduct.errors.full_messages}
    end
  end
end
