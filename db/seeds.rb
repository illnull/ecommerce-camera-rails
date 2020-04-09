# frozen_string_literal: true

require 'csv'

AdminUser.destroy_all
Product.destroy_all
Category.destroy_all

category_file = 'vendor/data/category.csv'
backpack_file = 'vendor/data/backpack.csv'
camera_file = 'vendor/data/camera.csv'
lens_file = 'vendor/data/lens.csv'
merch_file = 'vendor/data/merch.csv'

category_json = CSV.read(category_file, headers: true).map(&:to_hash)
backpack_json = CSV.read(backpack_file, headers: true).map(&:to_hash)
camera_json = CSV.read(camera_file, headers: true).map(&:to_hash)
lens_json = CSV.read(lens_file, headers: true).map(&:to_hash)
merch_json = CSV.read(merch_file, headers: true).map(&:to_hash)

category_json.each do |category|
  Category.create(
    categoryDescription: category['type']
  )
end

backpack = Category.where(categoryDescription: 'backpack').take
backpack_json.each do |data|
  backpack.products.create(
    name: data['name'],
    price: data['price'].to_f * 100.to_i,
    description: data['description'],
    image: data['image'],
    qty: rand(40..60)
  )
end

camera = Category.where(categoryDescription: 'camera').take
camera_json.each do |data|
  camera.products.create(
    name: data['product_name'],
    price: data['price'].to_f * 100.to_i,
    description: Faker::Quote.famous_last_words,
    image: data['image src'],
    qty: rand(20..50)
  )
end

len = Category.where(categoryDescription: 'lens').take
lens_json.each do |data|
  len.products.create(
    name: data['product_name'],
    price: data['price'].to_f * 100.to_i,
    description: Faker::Quote.matz,
    image: data['image src'],
    qty: rand(10..50)
  )
end

merch = Category.where(categoryDescription: 'merch').take
merch_json.each do |data|
  merch.products.create(
    name: data['p_name'],
    price: data['p_old_price'].to_f * 100.to_i,
    description: Faker::Quote.most_interesting_man_in_the_world,
    image: data['product_image src'],
    qty: rand(100..200)
  )
end

puts "Created #{Category.count} categories"
puts "Created #{Product.count} products"

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: '123123', password_confirmation: '123123')
end
