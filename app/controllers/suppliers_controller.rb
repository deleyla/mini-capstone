class SuppliersController < ApplicationController

  def index
    # get all suppliers from my db
    suppliers = Supplier.all
    # show the user all the suppliers in my db
    render json: suppliers.as_json
  end

  def show
    # grab a single supplier from the db

    #go to params hash and get the id
    the_id = params['id']

    # grab a single supplier based on the id
    supplier = Supplier.find_by(id: the_id)

    # show a particular supplier
    render json: supplier.as_json
  end

  def create
    # framework of information needed to create a new supplier
    supplier = Supplier.new(
      name: params['name'],
      email: params['email'],
      phone_number: params['phone_number']
      )
    # save the information from user input to create a new supplier
    supplier.save

    # show the supplier
    render json: supplier.as_json
  end

  def update
    # go to params hash and get the id
    the_id = params['id']

    # grab a single supplier based on the id
    supplier = Supplier.find_by(id: the_id)

    # update it
    supplier.name = params['name'] || supplier.name
    supplier.email = params['email'] || supplier.email
    supplier.phone_number = params['phone_number'] || supplier.phone_number

    # save the information from user input to create a new supplier
    supplier.save
    # print the information as json
    render json: supplier.as_json
  end

  def destroy
    #find a particular supplier in my db
    the_id = params['id']
    supplier = Supplier.find_by(id: the_id)
    #destroy the selected supplier
    supplier.destroy
    render json: {message: "You deleted the supplier"}
  end
end
