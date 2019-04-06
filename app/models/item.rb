class Item < ApplicationRecord
  belongs_to :user
  has_many :categories_items
  has_many :categories, throug: category_items
  has_many :brand_items
  has_many :brand, throug: brand_items
  has_many :item_image_items
  has_many :item_image, throug: item_image_items
  belongs_to :condition
  belongs_to :shipping_burden
  belongs_to :shipping_style
  belongs_to :date_of_shipment
  belongs_to :credit
  belongs_to :buyer
  has_many :item_size_items
  has_many :items, throug: item_size_items
  belongs_to :status
  has_many :messages, :dependent => :destroy
  has_many :points
  has_many :evaluations
  has_many :likes, :dependent => :destroy

end
