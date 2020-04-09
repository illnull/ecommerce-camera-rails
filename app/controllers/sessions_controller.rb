# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    @customer = Customer.find_by(email: session_params[:email])

    if @customer&.authenticate(session_params[:password])
      login!
      render json: {
        logged_in: true,
        customer: @customer
      }
    else
      render json: {
        status: 401,
        errors: ['no such customer', 'verify credentials and try again or signup']
      }
    end
  end

  def is_logged_in?
    if logged_in? && current_customer
      render json: {
        logged_in: true,
        customer: current_customer
      }
    else
      render json: {
        logged_in: false,
        message: 'no such customer'
      }
    end
  end

  def destroy
    logout!
    render json: {
      status: 200,
      logged_out: true
    }
    end

    private

  def session_params
    params.permit(:email, :password)
    end
  end
