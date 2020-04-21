# frozen_string_literal: true

ActiveAdmin.register Product do
  permit_params :price, :name, :description, :image, :qty, :category_id, :imagesrc, :sale

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file
    end
    f.actions
  end
end
