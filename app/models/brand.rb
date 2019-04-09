class Brand < ApplicationRecord
  has_many :BrandItems
  has_many :items, through: :BrandItems
end
