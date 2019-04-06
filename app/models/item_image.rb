class ItemImage < ApplicationRecord
  has_many :item_image_items
  has_many :items, though: item_image_items

  mount_uploader :image, ImageUploader
end
