class ImagesController < ApplicationController
  def index
    # get all images from my db
    images = Image.all

    # show the user all the images in my db
    render json: images.as_json
  end

  def create
    # framework of information needed to create a new image
    image = Image.new(
      product_id: params['product_id'],
      url: params['url'],
      name: params['name']
      )
    # save the information from user input to create a new image
    image.save

    #happy path
    if image.save
      render json: image.as_json
    #sad path
    else
      render json: {errors: image.errors.full_messages}
    end
  end
end
