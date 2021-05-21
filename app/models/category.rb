class Category < ApplicationRecord
  has_many :category_products
  has_many :procuts, through: :category_products
end
