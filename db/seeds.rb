# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

step = "Etape 1 :
Eodem tempore etiam Hymetii praeclarae indolis viri negotium est actitatum, cuius hunc novimus esse textum. cum Africam pro consule regeret Carthaginiensibus victus inopia iam lassatis, ex horreis Romano populo destinatis frumentum dedit, pauloque postea cum provenisset segetum copia, integre sine ulla restituit mora.
Etape 2:
Coactique aliquotiens nostri pedites ad eos persequendos scandere clivos sublimes etiam si lapsantibus plantis fruticeta prensando vel dumos ad vertices venerint summos, inter arta tamen et invia nullas acies explicare permissi nec firmare nisu valido gressus: hoste discursatore rupium abscisa volvente, ruinis ponderum inmanium consternuntur, aut ex necessitate ultima fortiter dimicante, superati periculose per prona discedunt.
Etape 3:
Et quoniam apud eos ut in capite mundi morborum acerbitates celsius dominantur, ad quos vel sedandos omnis professio medendi torpescit, excogitatum est adminiculum sospitale nequi amicum perferentem similia videat, additumque est cautionibus paucis remedium aliud satis validum, ut famulos percontatum missos quem ad modum valeant noti hac aegritudine colligati, non ante recipiant domum quam lavacro purgaverint corpus. ita etiam alienis oculis visa metuitur labes.
"

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
User.create(
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
puts 'Finished, the fridge is full of ingredients !'

puts 'Creating 10 recipes..'
10.times do
  recipe = Recipe.new(
    name: Faker::Food.dish,
    duration: "#{Faker::Number.between(from: 1, to: 180)} min",
    step: step,
    difficulty: Faker::Number.between(from: 1, to: 10)
  )
  recipe.user = User.all.sample
  recipe.save!
end
puts '10 recipes created !'
