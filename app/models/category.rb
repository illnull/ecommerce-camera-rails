# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :products
  validates :categoryDescription, presence: true
end
