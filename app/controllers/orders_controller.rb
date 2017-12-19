class OrdersController < ApplicationController

  def create
  # framework of information needed to create a new order
    order = Order.new(
      product_id: params['product_id'],
      quantity: params['quantity']
      )
    # save the information from user input to create a new order
    order.save

    # show the order
    render json: order.as_json
  end


end
