# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
i = Ingredient.create(name: 'Paprika')
ii = Ingredient.create(name: 'Clove')
iii = Ingredient.create(name: 'Ginger')
iiii = Ingredient.create(name: 'Cider')

recipe = Recipe.create(name: 'Awesome Stuff')
recipe.ingredients << i
recipe.ingredients << ii