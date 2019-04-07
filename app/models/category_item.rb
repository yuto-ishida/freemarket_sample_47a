class CategoryItem < ApplicationRecord
  has_many :categories
  has_many :items
end
