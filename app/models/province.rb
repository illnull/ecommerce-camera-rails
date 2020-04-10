# frozen_string_literal: true

class Province < ApplicationRecord
  has_one :customer
end
