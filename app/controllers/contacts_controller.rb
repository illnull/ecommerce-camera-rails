# frozen_string_literal: true

class ContactsController < ApplicationController
  respond_to :json

  def view
    @contact = Contact.all
    respond_with(@contact)
  end
end
