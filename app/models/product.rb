class Product < ApplicationRecord
  belongs_to :category
  validates :name, :price, :image, presence: true
end
