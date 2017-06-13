
#rake db:reset db:seed

apple_pie = Recipe.create({name: "apple pie"}) #-> id1
peach_pie = Recipe.create({name: "peach pie"}) #-> id2

apple = Ingredient.create({name: "apple"}) #-> id1
peach = Ingredient.create({name: "peach"}) #-> id2
crust = Ingredient.create({name: "crust"}) #-> id3

apple_apple = RecipeIngredient.create({recipe_id:1, ingredient_id: 1})
apple_crust = RecipeIngredient.create({recipe_id:1, ingredient_id: 3})
peach_peach = RecipeIngredient.create({recipe_id:2, ingredient_id: 2})
peach_crust = RecipeIngredient.create({recipe_id:2, ingredient_id: 3})