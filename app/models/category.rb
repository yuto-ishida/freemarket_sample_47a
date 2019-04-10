class Category < ApplicationRecord
  has_many :CategoryItems
  has_many :items, through: :CategoryItems
end
