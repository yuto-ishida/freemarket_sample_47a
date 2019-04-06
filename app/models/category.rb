class Category < ApplicationRecord
  has_many :category_items
  has_many :items, through: categories_items
end
