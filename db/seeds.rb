# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Ingredient.create(name: "pasta")
Ingredient.create(name: "meat")
Ingredient.create(name: "veggies")

Ingredient.create(name: "broth")
Ingredient.create(name: "cheese")
Ingredient.create(name: "bread")

Recipe.create(name: "French Onion")
Recipe.create(name: "Meat Sauce")


RecipeIngredient.create(recipe_id: 1, ingredient_id: 4)
RecipeIngredient.create(recipe_id: 1, ingredient_id: 5)
RecipeIngredient.create(recipe_id: 1, ingredient_id: 6)

RecipeIngredient.create(recipe_id: 2, ingredient_id: 1)
RecipeIngredient.create(recipe_id: 2, ingredient_id: 2)
RecipeIngredient.create(recipe_id: 2, ingredient_id: 3)