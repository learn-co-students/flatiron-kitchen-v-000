# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
["sambar", "tteokbokki", "ramen"].each {|r| Recipe.create(name: r)}
["chili peppers", "tamarind", "turmeric", "noodles", "rice cakes"].each {|i| Ingredient.create(name: i)}