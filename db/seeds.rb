# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


ingredient1 = Ingredient.create(name: "carrots")
ingredient2 = Ingredient.create(name: "potatoes")
ingredient3 = Ingredient.create(name: "rice")
ingredient4 = Ingredient.create(name: "peppers")
ingredient5 = Ingredient.create(name: "cheese")
ingredient6 = Ingredient.create(name: "blueberries")
ingredient7 = Ingredient.create(name: "cherries")


recipe1 = Recipe.create(name: "Good Food Recipe")
recipe2 = Recipe.create(name: "Better Food Recipe")
recipe3 = Recipe.create(name: "Da Best Food Recipe")

recipe1.ingredients << ingredient1
recipe1.ingredients << ingredient2
recipe1.ingredients << ingredient3
recipe2.ingredients << ingredient4
recipe2.ingredients << ingredient5
recipe2.ingredients << ingredient6
recipe3.ingredients << ingredient7
