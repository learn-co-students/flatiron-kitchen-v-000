# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

recipe1 = Recipe.create(name: "french 1")
recipe2 = Recipe.create(name: "french 2")
recipe3 = Recipe.create(name: "french 3")

ingredient1 = Ingredient.create(name: "salt")
ingredient2 = Ingredient.create(name: "pepper")
ingredient3 = Ingredient.create(name: "flour")
