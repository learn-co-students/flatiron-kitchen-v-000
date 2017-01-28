## Models

ingredients
has_many :recipe_ingredients
has_many :recipes, through: :recipe_ingredients

recipes
has_many :recipe_ingredients
has_may :ingredients, through: recipe_ingredients

recipe_ingredients
belongs_to :ingredient
belongs_to :recipe
