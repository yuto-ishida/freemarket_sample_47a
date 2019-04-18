class Category < ApplicationRecord
  has_many :CategoryItems
  has_many :items, through: :CategoryItems
  has_ancestry
end
