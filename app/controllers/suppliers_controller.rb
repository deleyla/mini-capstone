class SuppliersController < ApplicationController

  def index
    # get all suppliers from my db
    suppliers = Supplier.all
    # show the user all the products in my db
    render json: suppliers.as_json
  end

end
