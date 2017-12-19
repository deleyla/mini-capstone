class OrdersController < ApplicationController

  def index
    # get all orders from my db
    orders = Order.all
    # show the user all the orders in my db
    render json: orders.as_json
  end


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

    #happy path
    if order.save
      render json: order.as_json
    #sad path
    else
      render json: {errors: order.errors.full_messages}
    end
  end

  def as_json
    {
      user_id: user_id,
      product_id: product_id,
      quantity: quantity, 
      price: price,
      tax: tax,
      total: total
    }
  end


end
