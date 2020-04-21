# frozen_string_literal: true

require 'csv'

AdminUser.destroy_all
Product.destroy_all
Category.destroy_all
Customer.destroy_all
Province.destroy_all
Contact.destroy_all
About.destroy_all

provinces = { 'name' => 'AB', 'pst' => 0,       'gst' => 0.05,    'hst' => 0 },
            { 'name' => 'BC', 'pst' => 0.07,    'gst' => 0.05,    'hst' => 0 },
            { 'name' => 'MB', 'pst' => 0.07,    'gst' => 0.05,    'hst' => 0 },
            { 'name' => 'NB', 'pst' => 0,       'gst' => 0,       'hst' => 0.15 },
            { 'name' => 'NL', 'pst' => 0,       'gst' => 0,       'hst' => 0.15 },
            { 'name' => 'NT', 'pst' => 0,       'gst' => 0.05,    'hst' => 0 },
            { 'name' => 'NS', 'pst' => 0,       'gst' => 0,       'hst' => 0.15 },
            { 'name' => 'NU', 'pst' => 0,       'gst' => 0.05,    'hst' => 0 },
            { 'name' => 'ON', 'pst' => 0,       'gst' => 0,       'hst' => 0.13 },
            { 'name' => 'PE', 'pst' => 0,       'gst' => 0,       'hst' => 0.15 },
            { 'name' => 'QC', 'pst' => 0.09975, 'gst' => 0.05,    'hst' => 0 },
            { 'name' => 'SK', 'pst' => 0.06,    'gst' => 0.05,    'hst' => 0 },
            { 'name' => 'YT', 'pst' => 0,       'gst' => 0.05,    'hst' => 0 }

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
  created = backpack.products.create(
    name: data['name'],
    price: data['price'].to_f * 100.to_i,
    description: data['description'],
    image: data['image'],
    qty: rand(40..60)
  )
  download_image = open(URI.escape(data['image']))
  created.imagesrc.attach(io: download_image, filename: "image-#{backpack.name}.jpg")
end

camera = Category.where(categoryDescription: 'camera').take
camera_json.each do |data|
  created = camera.products.create(
    name: data['product_name'],
    price: data['price'].to_f * 100.to_i,
    description: Faker::Quote.famous_last_words,
    image: data['image src'],
    qty: rand(20..50)
  )
  download_image = open(URI.escape(data['image src']))
  created.imagesrc.attach(io: download_image, filename: "image-#{camera.name}.jpg")
end

len = Category.where(categoryDescription: 'lens').take
lens_json.each do |data|
  created = len.products.create(
    name: data['product_name'],
    price: data['price'].to_f * 100.to_i,
    description: Faker::Quote.matz,
    image: data['image src'],
    qty: rand(10..50)
  )
  download_image = open(URI.escape(data['image src']))
  created.imagesrc.attach(io: download_image, filename: "image-#{len.name}.jpg")
end

merch = Category.where(categoryDescription: 'merch').take
merch_json.each do |data|
  created = merch.products.create(
    name: data['p_name'],
    price: data['p_old_price'].to_f * 100.to_i,
    description: Faker::Quote.most_interesting_man_in_the_world,
    image: data['product_image src'],
    qty: rand(100..200)
  )
  download_image = open(URI.escape(data['product_image src']))
  created.imagesrc.attach(io: download_image, filename: "image-#{merch.name}.jpg")
end

provinces.each do |data|
  Province.create(
    name: data['name'],
    pst: data['pst'],
    gst: data['gst'],
    hst: data['hst']
  )
end

About.create(
  content: 'Established 2012 Langly bags were inspired by the lives of freelance photographers and nomadic professionals looking for something to protect their gear with style and ease. After years of searching for the perfect camera bag with no avail, photographer Evan Lane decided to take things into his own hands and Langly Bags were born. Today Langly bags have been worn on all seven continents by amateurs and professionals alike.'
)

Contact.create(
  content: 'For immediate assistance, call toll free (204) 222-2222. Or email Virtual.Front.Desk@datskay.Team and we will reply as soon as possible.'
)

puts "Created #{Category.count} categories"
puts "Created #{Product.count} products"
puts "Created #{Province.count} provinces"

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: '123123', password_confirmation: '123123')
end
