Ingredient.create(name: 'Paprika')
Ingredient.create(name: 'Clove')
Ingredient.create(name: 'Ginger')
Ingredient.create(name: 'Cider')

Recipe.create(name: 'Greate Recipe', ingredients: [Ingredient.first])