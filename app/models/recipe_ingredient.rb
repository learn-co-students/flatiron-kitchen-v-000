class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipes
  belongs_to :ingredient
end
