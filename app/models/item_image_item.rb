class ItemImageItem < ApplicationRecord
  belongs_to :item
  belongs_to :item_image, :dependent => :destroy
end
