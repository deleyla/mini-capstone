class OrdersController < ApplicationController

  def index
    # get all orders from my db
    orders = current_user.orders
    # show the user all the orders in my db
    render json: orders.as_json
  end


  def create
    # define calculations
    tax_rate = 0.09
    product = Product.find_by(id:params[:product_id])
    calculated_subtotal = product.price * params[:quantity].to_i
    calculated_tax = calculated_subtotal * tax_rate
    calculated_total = calculated_tax + calculated_subtotal

  # framework of information needed to create a new order
    order = Order.new(
      user_id: current_user.id,
      product_id: params['product_id'],
      quantity: params['quantity'],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
      )
    # save the information from user input to create a new order
    order.save

    #happy path
    if order.save
      render json: order.as_json
    #sad path
    else
      render json: {errors: order.errors.full_messages}
    end
  end

  # def as_json
  #   {
  #     user_id: user_id,
  #     product_id: product_id,
  #     quantity: quantity, 
  #     price: price,
  #     tax: tax,
  #     total: total
  #   }
  # end


end
