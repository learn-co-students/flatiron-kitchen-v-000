# Recipe_Ingredient Table
# ==============================
# recipe_id      - integer
# ingredient_id  - integer
# quantity       - integer
# measurement    - string (lbs, tbsp, tsp, etc)
# ==============================
class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
end
