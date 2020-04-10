# frozen_string_literal: true

class AddProvinceToCustomer < ActiveRecord::Migration[6.0]
  def change
    add_reference :customers, :province, foreign_key: true
  end
end
