# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  delete :logout, to: 'customers#logout'
  get :logged_in, to: 'customers#logged_in'
  root to: 'static#home'

  constraints ->(request) { request.format == :json } do
    resources :products
    resources :categories
    resources :customers
    resources :registerations
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
