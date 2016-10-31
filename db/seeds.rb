# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ingredients = Ingredient.create([{name: 'Tomato'}, {name: 'Celery'}, {name: 'Lettuce'}])
recipes = Recipe.create([{name: 'Fruit Salad'}, {name: 'Waldorf Salad'}, {name: 'Ceasar Salad'}])
recipe_ingredients = RecipeIngredient.create ([
  {recipe_id: 1, ingredient_id: 1}, 
  {recipe_id: 1, ingredient_id: 2}, 
  {recipe_id: 1, ingredient_id: 3},

  {recipe_id: 2, ingredient_id: 1}, 
  {recipe_id: 2, ingredient_id: 2}, 
  {recipe_id: 2, ingredient_id: 3},

  {recipe_id: 3, ingredient_id: 1}, 
  {recipe_id: 3, ingredient_id: 2}, 
  {recipe_id: 3, ingredient_id: 3} 
  ])