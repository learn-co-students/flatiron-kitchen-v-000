# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ingredient1 = Ingredient.create(name: 'spaghetti')
ingredient2 = Ingredient.create(name: 'meatball')
ingredient3 = Ingredient.create(name: 'lettuce')
ingredient4 = Ingredient.create(name: 'spaghetti sauce')
ingredient5 = Ingredient.create(name: 'tomato')
ingredient6 = Ingredient.create(name: 'avocado')

recipe1 = Recipe.create(name: 'Spaghetti and Meatballs')
recipe2 = Recipe.create(name: 'Garden Salad')

recipe1.ingredients << ingredient1
recipe1.ingredients << ingredient2
recipe1.ingredients << ingredient4

recipe2.ingredients << ingredient3
recipe2.ingredients << ingredient5
recipe2.ingredients << ingredient6
