class Brand < ApplicationRecord
  has_many :brand_items
  has_many :items, through: brand_items
end
