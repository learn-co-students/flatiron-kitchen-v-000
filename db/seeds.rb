# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


@lasagna = Recipe.create(name: "Lasagna")
@tacos = Recipe.create(name: "Tacos")
@beef = Ingredient.create(name: "Ground beef")
@lettuce = Ingredient.create(name: "Lettuce")
@noodles = Ingredient.create(name: "Noodles")

@lasagna.ingredients << @beef
@lasagna.ingredients << @noodles
@tacos.ingredients << @beef
@tacos.ingredients << @lettuce

@lasagna.save
@tacos.save
