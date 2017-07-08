# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Ingredient.create(:name => "Rice", :unit => "Cups", :quantity => 10)
Ingredient.create(:name => "Flour", :unit => "Cups", :quantity => 10)
Ingredient.create(:name => "Sugar", :unit => "Cups", :quantity => 10)
Ingredient.create(:name => "Salt", :unit => "Tbsp", :quantity => 10)
Ingredient.create(:name => "Pepper", :unit => "Tbsp", :quantity => 10)
Ingredient.create(:name => "Maple Syrup", :unit => "Cups", :quantity => 10)
