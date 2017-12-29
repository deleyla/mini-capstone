class CartedProduct < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product, optional: true
  belongs_to :user, optional: true

  def as_json
    {
      id: id,
      product: product.as_json,
      quantity: quantity
    }
end
