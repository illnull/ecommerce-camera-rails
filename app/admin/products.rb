# frozen_string_literal: true

ActiveAdmin.register Product do
  permit_params :price, :name, :description, :image, :qty, :category_id
end
