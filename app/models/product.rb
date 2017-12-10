class Product < ApplicationRecord
  
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

  def as_json
    {
      id: id,
      name: name,
      price: price,
      image: image,
      description: description,
      is_discounted: is_discounted,
      tax: tax,
      total: total
    }
  end
end
