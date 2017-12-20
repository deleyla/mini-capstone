class Category < ApplicationRecord
  has_many :category_product
  has_many :products, through: :category_product
end
