# frozen_string_literal: true

class Customer < ApplicationRecord
  has_secure_password
  validates_presence_of :email, :password, :province_id, :address
  validates :firstName, format: { with: /\A[a-zA-Z]+\z/,
                                  message: 'only allows letters' }
  validates :lastName, format: { with: /\A[a-zA-Z]+\z/,
                                 message: 'only allows letters' }
  validates :country, format: { with: /\A[a-zA-Z]+\z/,
                                message: 'only allows letters' }
  validates :city, format: { with: /\A[a-zA-Z]+\z/,
                             message: 'only allows letters' }
  validates :phoneNumber, numericality: true
  validates_uniqueness_of :email
end
