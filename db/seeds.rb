# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ingredients = Ingredient.create([{name: 'sausage', quantity: 4}, {name: 'mushroom', quantity: 4}, {name: 'eggs', quantity: 10}])
recipe = Recipe.create([{name: 'omelette'}, {name: 'sausages'}])


