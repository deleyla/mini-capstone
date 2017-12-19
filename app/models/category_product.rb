class CategoryProduct < ApplicationRecord
  has_many :category
  has_many :product
end
