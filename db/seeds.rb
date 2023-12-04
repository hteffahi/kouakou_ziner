# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroy all the Database to recreate it"
puts "Destroy indregients"
Ingredient.destroy_all
puts "Destroy recipes"
Recipe.destroy_all
puts "Destroy categories"
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
)
puts "1 user created !"

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

puts 'Creating 15 random ingredients ...'

  ingredient_1 = Ingredient.create!(name: "apple", amount: 4, unit: "piece", expiration: "Mon, 18 Dec 2023", user: user, category_id: category1.id)
  ingredient_2 = Ingredient.create!(name: "carrot", amount: 2, unit: "piece", expiration: "Tue, 19 Dec 2023", user: user, category_id: category2.id)
  ingredient_3 = Ingredient.create!(name: "flour", amount: 100, unit: "oz", expiration: "Thur, 21 Dec 2023", user: user, category_id: category6.id)
  ingredient_4 = Ingredient.create!(name: "potatoe", amount: 6, unit: "piece", expiration: "Wed, 20 Dec 2023", user: user, category_id: category6.id)
  ingredient_5 = Ingredient.create!(name: "lettuce", amount: 1, unit: "piece", expiration: "Sat, 9 Dec 2023", user: user, category_id: category2.id)
  ingredient_6 = Ingredient.create!(name: "bean", amount: 6, unit: "cup", expiration: "Wed, 20 Dec 2023", user: user, category_id: category6.id)
  ingredient_7 = Ingredient.create!(name: "oil", amount: 50, unit: "oz", expiration: "Mon, 25 Dec 2023", user: user, category_id: category6.id)
  ingredient_8 = Ingredient.create!(name: "milk", amount: 150, unit: "oz", expiration: "Mon, 11 Dec 2023", user: user, category_id: category3.id)
  ingredient_9 = Ingredient.create!(name: "penne", amount: 10, unit: "cup", expiration: "Mon, 8 Jan 2024", user: user, category_id: category6.id)
  ingredient_10 = Ingredient.create!(name: "broccoli", amount: 2, unit: "piece", expiration: ",Sat, 9 Dec 2023", user: user, category_id: category2.id)
  ingredient_11 = Ingredient.create!(name: "eggplant", amount: 4, unit: "piece", expiration: "Sun, 10 Dec 2023", user: user, category_id: category2.id)
  ingredient_12 = Ingredient.create!(name: "egg", amount: 8, unit: "piece", expiration: "Thur, 14 Dec 2023", user: user, category_id: category5.id)
  ingredient_13 = Ingredient.create!(name: "chicken", amount: 0.5, unit: "piece", expiration: "Thur, 14 Dec 2023", user: user, category_id: category5.id)
  ingredient_13 = Ingredient.create!(name: "camembert", amount: 0.5, unit: "piece", expiration: "Sun, 10 Dec 2023", user: user, category_id: category4.id)

puts 'Finished, the fridge is full of ingredients !'
