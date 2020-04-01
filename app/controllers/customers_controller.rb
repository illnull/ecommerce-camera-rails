# frozen_string_literal: true

class CustomersController < ApplicationController
  def create
    customer = Customer.find_by(email: params[:email])
                       .try(:authenticate, params[:password])

    if customer
      session[:customer_id] = customer.id
      render json: {
        status: :created,
        logged_in: true,
        customer: customer,
        ass: 'ass'
      }
    else
      render json: { status: 401 }
    end
  end

  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: {
        logged_in: false
      }
    end
  end

  def logout
    reset_session
    render json: { status: 200, logged_out: true }
  end
end
