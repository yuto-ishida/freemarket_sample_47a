class ItemImageItem < ApplicationRecord
  belongs_to :items, though: item_images
  has_many :item_images
end
