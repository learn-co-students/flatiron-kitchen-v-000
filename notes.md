# Keep track of all recipes
# Keep track of all ingredients on hand and what is used in each recipe
# Join Table "recipe_ingredients" to keep track of ingredients used in each recipe

X  ### three tables: recipes, ingredients, recipe_ingredients
X  #### recipes table: name, content
X  #### ingredients table: name
X  #### recipe_ingredients join table: recipe_id, ingredient_id

x  ### three models: Recipe, Ingredient, RecipeIngredient

  ### three controllers: recipes_controller, ingredients_controller, recipe_ingredients_controller

### views:
  # Recipe
    ## index
    ## new
    ## show
    ## edit
    ## _recipe partial

  # Ingredient
    ## index
    ## new
    ## show
    ## edit

##index pages or things like page headers or links aren't tested but nice to have


***Remember  `--no-test-framework` ***

//HINT:// If you give a checkbox `<input>` a name attribute like `ninja_turtle_colors[]`, each ninja turtle color will be passed to the `params` hash in an array: `{ ninja_turtle_colors: ["red", "blue", "orange", "purple"] }`.



 Bonuses!

Keep track of the quantity of ingredients currently on hand. Display on each recipe page how many dishes can be made given the existing ingredients.
Write RSpec unit tests to verify your ingredients-to-dishes calculator.
