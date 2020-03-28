# frozen_string_literal: true

require 'csv'

AdminUser.destroy_all
Product.destroy_all
Category.destroy_all

category_file = 'vendor/data/category.csv'
backpack_file = 'vendor/data/backpack.csv'
camera_file = 'vendor/data/camera.csv'
lens_file = 'vendor/data/lens.csv'

category_json = CSV.read(category_file, headers: true).map(&:to_hash)
backpack_json = CSV.read(backpack_file, headers: true).map(&:to_hash)
camera_json = CSV.read(camera_file, headers: true).map(&:to_hash)
lens_json = CSV.read(lens_file, headers: true).map(&:to_hash)

category_json.each do |category|
  Category.create(
    categoryDescription: category['type']
  )
end

backpack = Category.where(categoryDescription: 'backpack').take
backpack_json.each do |data|
  backpack.products.create(
    name: data['name'],
    price: data['price'],
    description: data['description'],
    image: data['image']
  )
end

camera = Category.where(categoryDescription: 'camera').take
camera_json.each do |data|
  camera.products.create(
    name: data['product_name'],
    price: data['price'],
    image: data['image src']
  )
end

len = Category.where(categoryDescription: 'lens').take

lens_json.each do |data|
  len.products.create(
    name: data['product_name'],
    price: data['price'],
    image: data['image src']
  )
end

puts "Created #{Category.count} categories"
puts "Created #{Product.count} products"

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end
