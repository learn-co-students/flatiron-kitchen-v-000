@i = Ingredient.create!(name: 'Parsley')
@i1 = Ingredient.create!(name: 'Peanut Butter')

@r = Recipe.create!(name: 'Peanut Butter & Jelly')
@r1 = Recipe.create!(name: 'Pizza')

RecipeIngredient.create(recipe_id: @r.id, ingredient_id: @i1.id)
RecipeIngredient.create(recipe_id: @r1.id, ingredient_id: @i.id)
