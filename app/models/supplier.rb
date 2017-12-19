class Supplier < ApplicationRecord
  has_many :product

  def as_json
    {
      id: id,
      name: name,
      email: email, 
      phone_number: phone_number, 
      products: products.map{ |product| product.name}
    }
  end

  def products
    # (fancy activerecord) array
    # get id from supplier, match that value to the supplier_id column on products and return all products that belong to the supplier
    Product.where(supplier_id: id)
  end

end
