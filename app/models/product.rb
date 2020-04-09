# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  validates :name, :price, presence: true
end
