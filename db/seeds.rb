# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pancakes = Recipe.create(name: "Pancakes")
cookies = Recipe.create(name: "Cookies")

flour = Ingredient.create(name: "Flour")
eggs = Ingredient.create(name: "Eggs")
oil = Ingredient.create(name: "Oil")
sugar = Ingredient.create(name: "Sugar")
chocolate_chips = Ingredient.create(name: "Chocolate Chips")
milk = Ingredient.create(name: "Milk")
brown_sugar = Ingredient.create(name: "Brown Sugar")
baking_powder = Ingredient.create(name: "Baking Powder")

pancakes.ingredients = [flour, eggs, oil, sugar, milk, baking_powder]
cookies.ingredients = [flour, eggs, oil, sugar, brown_sugar, baking_powder, chocolate_chips]
