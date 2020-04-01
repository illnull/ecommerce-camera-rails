# frozen_string_literal: true

class StaticController < ApplicationController
  def home
    render json: { status: 'hello world' }
  end
end
