# frozen_string_literal: true

class Customer < ApplicationRecord
  has_secure_password
  validates_presence_of :email, :password, :firstName, :lastName, :phoneNumber, :city, :country
  validates_uniqueness_of :email
end
