# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  corn_beef_and_cabbage = Recipe.create([{ name: 'Corn Beef and Cabbage' }])
  moroccan_lamb = Recipe.create([{ name: 'Moroccan Lamb' }])
  squid_masala = Recipe.create([{ name: 'Squid Masala' }])
  fish_chowder = Recipe.create([{ name: 'Fish Chowder' }])
  lomo_saltado = Recipe.create([{ name: 'Lomo Saltado' }])


   beef = Ingredient.create([{ name: 'Beef' }])
   lamb = Ingredient.create([{ name: 'Lamb' }])
   squid = Ingredient.create([{ name: 'Squid' }])
   fish = Ingredient.create([{ name: 'Fish' }])
   potatoes = Ingredient.create([{ name: 'Potatoes' }])
