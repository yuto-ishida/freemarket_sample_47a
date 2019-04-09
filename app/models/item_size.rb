class ItemSize < ApplicationRecord
  has_many :item_size_items
  has_many :items, through: :item_size_items
end
