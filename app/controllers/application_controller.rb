# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  # protect_from_forgery prepend: true, with: :exception

  helper_method :login!, :logged_in?, :current_customer, :authorized_customer?, :logout!
  def login!
    session[:customer_id] = @customer.id
  end

  def logged_in?
    !session[:customer]
  end

  def current_customer
    if session[:customer]
      @current_customer ||= Customer.find(session[:customer])
    end
  end

  def authorized_customer?
    @customer == current_customer
  end

  def logout!
    session.clear
  end
end
