# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

recipe = Recipe.create(name: "sammich")
recipe2 = Recipe.create(name: "a gumbo")

recipe.ingredients = [Ingredient.create(name: "bread"), Ingredient.create(name: "cheese")]
recipe2.ingredients = [Ingredient.create(name: "roux"), Ingredient.create(name: "okra"), Ingredient.create(name: "all the seafood")]
