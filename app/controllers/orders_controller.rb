class OrdersController < ApplicationController
  # before_action :authenticate_user
  def index
    # get all orders from my db
    if current_user
      p current_user
      orders = current_user.orders
      render json: orders.as_json
    else
      p "no current user"
      render json: []
    end
  end


  def create

    # define calculations
    tax_rate = 0.09
    calculated_subtotal = 0
    #find all the products in this order
    carted_products = CartedProduct.where(user_id: current_user.id).where(status: "carted")
    carted_products.each do |carted_product|
      calculated_subtotal += carted_product.product.price
    end
    # add up the prices of all of them

    # order = Order.new(
    #   user_id: current_user.id,
    #   subtotal: ,
    #   tax: ,
    #   total:
    #   )
  #   # define calculations
  #   tax_rate = 0.09
  #   product = Product.find_by(id:params[:product_id])
  #   calculated_subtotal = product.price * params[:quantity].to_i
  #   calculated_tax = calculated_subtotal * tax_rate
  #   calculated_total = calculated_tax + calculated_subtotal

  # # framework of information needed to create a new order
  #   order = Order.new(
  #     user_id: current_user.id,
  #     product_id: params['product_id'],
  #     quantity: params['quantity'],
  #     subtotal: calculated_subtotal,
  #     tax: calculated_tax,
  #     total: calculated_total
  #     )
  #   # save the information from user input to create a new order
  #   order.save

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
