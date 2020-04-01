# frozen_string_literal: true

class RegisterationsController < ApplicationController
  respond_to :json
  def create
    customer = Customer.create!(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if customer
      session[:customer_id] = customer.id
      render json: {
        status: :created,
        customer: customer
      }
    else
      render json: { status: 500 }
    end
  end
end
