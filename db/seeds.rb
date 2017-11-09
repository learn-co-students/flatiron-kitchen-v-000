# Trisha Yearwood's Blueberry Pancakes Recipe
# http://www.foodnetwork.com/recipes/trisha-yearwood/blueberry-pancakes-recipe.html

blueberry_pancakes = Recipe.new(name: 'Blueberry Pancakes')
blueberry_pancakes_ingredients = [
  {name: 'All-purpose flour', unit: 'cup'},
  {name: 'Sugar', unit: "tablespoon"},
  {name: 'Baking powder', unit: "teaspoon"},
  {name: 'Baking soda', unit: "teaspoon"},
  {name: 'Salt', unit: "teaspoon"},
  {name: 'Large eggs', unit: "whole"},
  {name: 'Milk', unit: "cup"},
  {name: 'Sour cream', unit: "cup"},
  {name: 'Butter', unit: "stick"},
  {name: 'Vanilla extract', unit: "teaspoon"},
  {name: 'Blueberries', unit: "cup"},
  {name: 'Lemon zest', unit: "teaspoon"}
]
blueberry_pancakes_ingredients.each{|i| blueberry_pancakes.ingredients.build(i)}
blueberry_pancakes.save

# Jake the Dog's Bacon Pancakes Recipe
# https://www.youtube.com/watch?v=1eO5U_uN7DQ

bacon_pancakes = Recipe.new(name: 'Bacon Pancakes')
bacon_pancakes_ingredients = [
  {name: 'Some bacon', unit: "strips"},
  {name: 'Pancake', unit: "stack"}
]
bacon_pancakes_ingredients.each{|i| bacon_pancakes.ingredients.build(i)}
bacon_pancakes.save
