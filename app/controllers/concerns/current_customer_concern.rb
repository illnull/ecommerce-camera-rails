# frozen_string_literal: true

module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
  end

  def set_current_user
    if session[:customer_id]
      @current_customer = Customer.find(session[:customer_id])
    end
  end
end
