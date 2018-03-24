class RecipeIngredient < ActiveRecord::Base
    has_many :ingredients, through: :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients
end
