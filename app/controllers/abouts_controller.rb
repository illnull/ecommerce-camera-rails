# frozen_string_literal: true

class AboutsController < ApplicationController
  respond_to :json
  
  def view
    @about = About.all
    respond_with(@about)
  end
end
