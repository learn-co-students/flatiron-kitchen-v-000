Need 3 tables:
  recipes
    title

  recipe_ingredients
      recipe_id
      ingredient_id

  ingredients
      name
      quantity

Need 3 Models:
        recipe
          has_many :ingredients
          has_many :recipe_ingredients
          has_many :ingredients, through :recipe_ingredients
          accepts_nested_attributes_for :ingredients
        ingredient
          belongs_to :ingredient
          has_many :recipe_ingredients
          has_many :recipes, through :recipe_ingredients
        recipe_ingredient
          belongs_to :recipe
          belongs_to :ingredient

Need 2 controllers:
        recipes
        ingredients
