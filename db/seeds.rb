# Trisha Yearwood's Blueberry Pancakes Recipe
# http://www.foodnetwork.com/recipes/trisha-yearwood/blueberry-pancakes-recipe.html

blueberry_pancakes = Recipe.new(name: 'Blueberry Pancakes', servings: 6)
blueberry_pancakes_ingredients = ['All-purpose flour', 'Sugar', 'Baking powder', 'Baking soda', 'Salt', 'Large eggs', 'Milk', 'Sour cream', 'Butter', 'Vanilla extract', 'Blueberries', 'Lemon zest']
blueberry_pancakes_ingredients.each{|i| blueberry_pancakes.ingredients.build(name: i, stock: 500)}
blueberry_pancakes.save

# Jake the Dog's Bacon Pancakes Recipe
# https://www.youtube.com/watch?v=1eO5U_uN7DQ

bacon_pancakes = Recipe.new(name: 'Bacon Pancakes', servings: 6)
bacon_pancakes_ingredients = ['Some bacon', 'Pancake']
bacon_pancakes_ingredients.each{|i| bacon_pancakes.ingredients.build(name: i, stock: 500)}
bacon_pancakes.save
