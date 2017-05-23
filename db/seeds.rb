Ingredient.destroy_all
Recipe.destroy_all

ingredients_names = ['Basil', 'Chocolate Chips', 'Oats', 'Flour', 'Oregano', 'Cilantro', 'Green Onions', 'Zucchini', 'Blueberries', 'Sugar', 'Eggs']

ingredients_names.each do |ingredient|
    Ingredient.create(name: ingredient)
end

recipe_names = ['Blueberry Pie', 'Pancakes', 'Omelet', 'Chocolate Chip Cookies']

recipe_names.each do |recipe|
    Recipe.create(name: recipe)
end