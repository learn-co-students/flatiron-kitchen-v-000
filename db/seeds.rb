# Trisha Yearwood's Blueberry Pancakes Recipe
# http://www.foodnetwork.com/recipes/trisha-yearwood/blueberry-pancakes-recipe.html

blueberry_pancakes = Recipe.new(name: 'Blueberry Pancakes')
blueberry_pancakes_ingredients = ['All-purpose flour', 'Sugar', 'Baking powder', 'Baking soda', 'Salt', 'Large eggs', 'Milk', 'Sour cream', 'Butter', 'Vanilla extract', 'Blueberries', 'Lemon zest']

blueberry_pancakes_ingredients.each do |i|
  inventory_count = rand(10) + 1
  quantity_count = rand(2) + 1
  blueberry_pancakes.ingredients.build(name: i, quantity: quantity_count, inventory: inventory_count)
  blueberry_pancakes.save
end

# Jake the Dog's Bacon Pancakes Recipe
# https://www.youtube.com/watch?v=1eO5U_uN7DQ

bacon_pancakes = Recipe.new(name: 'Bacon Pancakes')
bacon_pancakes_ingredients = ['Some bacon', 'Pancake']
bacon_pancakes_ingredients.each do |i|
  inventory_count = rand(10) + 1
  quantity_count = rand(2) + 1
  bacon_pancakes.ingredients.build(name: i, quantity: quantity_count, inventory: inventory_count )
  bacon_pancakes.save
end
