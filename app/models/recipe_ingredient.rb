class RecipeIngredient < ActiveRecord::Base
  belongs_to  :ingredients
  belongs_to  :recipes
end
