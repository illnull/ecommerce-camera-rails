# frozen_string_literal: true

Rails.application.routes.draw do
  get 'contacts/view'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # delete :logout, to: 'customers#logout'
  # get :logged_in, to: 'customers#logged_in'
  root to: 'static#home'

  constraints ->(request) { request.format == :json } do
    get '/categories', to: 'categories#categories'
    get '/categories/:id', to: 'products#by_categoryId'
    get '/products/all', to: 'products#all'
    get '/products/new', to: 'products#new'
    get '/products/:id', to: 'products#view'
    post '/customers/new', to: 'customers#create'
    get '/provinces/view', to: 'provinces#view'
    get '/contacts/view', to: 'contact#view'
    get '/abouts/view', to: 'abouts#view'
    # resources :customer, only: %i[create show index]
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    get '/loggedin', to: 'sessions#is_logged_in?'
    # resources :products
    # resources :customers
    # resources :registerations
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
