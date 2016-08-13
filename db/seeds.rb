# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Ingredient.create(name: "lemon", in_stock: true)
Ingredient.create(name: "parsley", in_stock: false)
Ingredient.create(name: "jamie", in_stock: true)
Ingredient.create(name: "teajuice", in_stock: true)
