# frozen_string_literal: true

class ProductsController < ApplicationController
  respond_to :json

  def all
    @products = Product.all
    respond_with(@products)
  end

  def sale
    @products = Product.where(sale: 1)
    respond_with(@products)
  end

  def view
    @products = Product.where(id: params[:id])
    respond_with(@products)
  end

  def new
    @products = Product.where("created_at > ?", 3.days.ago)
    respond_with(@products)
  end

  def by_categoryId
    @products = Product.where(category_id: params[:id])
    respond_with(@products)
  end

  def search
    if params[:categoryId] == "0"
      @products = Product.where("name LIKE ?", "%#{params[:keyword]}")
    else
      @products = Product.where("category_id = ? AND name LIKE ?", params[:categoryId], "%#{params[:keyword]}%")
    end
    respond_with(@products)
  end
end
