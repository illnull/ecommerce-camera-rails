# frozen_string_literal: true

class CategoriesController < ApplicationController
  respond_to :json

  def categories
    @categories = Category.all
    respond_with(@categories)
  end
end
