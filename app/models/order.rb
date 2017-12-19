class Order < ApplicationRecord
  belongs_to :user

  def subtotal
    price * quantity
  end

  def tax
    subtotal * 0.09
  end

  def total
    sum = price + tax
  end

end
