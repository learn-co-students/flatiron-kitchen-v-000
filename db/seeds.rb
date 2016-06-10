# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

recipes = Recipe.create([{ name: 'Pot Pie'}, { name: 'Chicken Tikka Massala'}, { name: 'Wonder Bread Surprise'}])

ingredients = Ingredient.create([{ name: 'chicken'}, { name: 'bread'}, { name: 'salt'}, { name: 'mayo'}, { name: 'veggies'}])

