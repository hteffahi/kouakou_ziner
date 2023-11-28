# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Destroy all the Database to recreate it"
puts "Destroy indregient"
Ingredient.destroy_all
puts "Destroy category"
Category.destroy_all
puts "Destroy user"
User.destroy_all
puts "DB clean"


puts 'Creating users'
user = User.create(
  first_name: 'John',
  last_name: 'Lennon',
  email: 'john@lennon.com',
  password: '123456'
  # encrypted_password: '123456'
)
puts "1 user created"


puts 'Creating categories ...'
category1 = Category.new(
    name: 'Fruits'
  )
  category1.save!

  category2 = Category.new(
    name: 'Vegetables'
  )
  category2.save!

  category3 = Category.new(
    name: 'Dairy products'
  )
  category3.save!

  category4 = Category.new(
    name: 'Cheeses'
  )
  category4.save!

  category5 = Category.new(
    name: 'Meats'
  )
  category5.save!

  category6 = Category.new(
    name: 'Starchs'
  )
  category6.save!

puts 'Categories created !'

puts 'Creating 50 random ingredients ...'
50.times do
  ingredient = Ingredient.new(
    name: Faker::Food.ingredient,
    amount: Faker::Number.digit,
    unit: Faker::Food.metric_measurement,
    expiration: Faker::Date.forward(days: 23)
    # category_id: rand(1..6)
  )
  ingredient.category_id = Category.all.sample.id
  ingredient.user = User.all.sample
  ingredient.save!
end
puts 'Finished, the fridge is full of ingredients'
