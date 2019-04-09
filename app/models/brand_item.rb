class BrandItem < ApplicationRecord
  belongs_to :item
  belongs_to :brand
end
