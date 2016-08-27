# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Recipe.create(name: "Green Eggs and Ham")
Recipe.create(name: "Meatloaf")
Recipe.create(name: "Ham Sandwich")

Ingredient.create(name: "Green Eggs")
Ingredient.create(name: "Ham")
Ingredient.create(name: "Meat")
Ingredient.create(name: "Loaf")
Ingredient.create(name: "Bread")
Ingredient.create(name: "Mustard")
