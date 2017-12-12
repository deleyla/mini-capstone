class Product < ApplicationRecord
  #price -> numericality has to be a number larger than zero
  #name -> unique
  #description -> minimum of 10 characters

  validates :price, presence: true
  validates :price, numericality: { greater_than:0 }
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :description, length: { in: 10...500}
  
  # Create a model method called `is_discounted` that returns true if an item is under $2 and false otherwise.
  def is_discounted
    if price < 2
      p true
    else
      p false
    end
  end

  # Create a model method called tax which will return the tax that would be charged for a particular product. (Assume a 9% tax rate.)

  def tax
    price * 0.09
  end

  #Create a model method called total which will return the sum of the price + tax.

  def total
    sum = price + tax
  end

  def availability
    if price <0
      p false
    else
      p true
    end
  end

  def as_json
    {
      id: id,
      name: name,
      image: image,
      price: price,
      tax: tax,
      total: total,
      is_discounted: is_discounted,
      description: description,
      availability: availability
    }
  end
end
