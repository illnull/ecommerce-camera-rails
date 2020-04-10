# frozen_string_literal: true

class CustomersController < ApplicationController
  # def create
  #   customer = Customer.find_by(email: params[:email])
  #                      .try(:authenticate, params[:password])

  #   if customer
  #     session[:customer_id] = customer.id
  #     render json: {
  #       status: :created,
  #       logged_in: true,
  #       customer: customer
  #     }
  #   else
  #     render json: { status: 401 }
  #   end
  # end

  # def logged_in
  #   if @current_customer
  #     render json: {
  #       logged_in: true,
  #       customer: @current_customer
  #     }
  #   else
  #     render json: {
  #       logged_in: false
  #     }
  #   end
  # end

  # def logout
  #   reset_session
  #   render json: { status: 200, logged_out: true }
  # end

  def index
    @customer = Customer.all
    if @customer
      render json: {
        customer: @customer
      }
    else
      render json: {
        status: 500,
        errors: ['no customer found']
      }
    end
  end

  def show
    @customer = Customer.find(params[:id])
    if @customer
      render json: {
        customer: @customer
      }
    else
      render json: {
        status: 500,
        errors: ['customer not found']
      }
    end
  end

  def create
    @customer = Customer.new(email: params[:email],
                             password: params[:password],
                             password_confirmation: params[:password_confirmation],
                             firstName: params[:firstName],
                             lastName: params[:lastName],
                             phoneNumber: params[:phoneNumber],
                             city: params[:city],
                             country: params[:country],
                             province_id: params[:province_id])
    if @customer.save
      login!
      render json: {
        status: :created,
        customer: @customer
      }
    else
      render json: {
        status: 500,
        errors: @customer.errors.full_messages
      }
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :password, :password_confirmation)
  end
end
