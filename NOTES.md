Tables -
  1. Ingredients
      - name

      has_many :recipe_ingredients
      has_many :recipes, through: :recipe_ingredients

  2. Recipes
      - name

      

  3. Recipe_ingredients
      - ingredients_id
      - recipes_id
