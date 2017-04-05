# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Ingredient.create(name: 'Rolled Oats')
Ingredient.create(name: 'Cinnamon')
Ingredient.create(name: 'Banana')
Ingredient.create(name: 'Almond Milk')
Recipe.create(name: "Oatmeal", ingredient_ids: [1, 2, 4])
