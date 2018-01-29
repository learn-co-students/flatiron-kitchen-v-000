class RecipeIngredient < ActiveRecord::Base
  belong_to :recipe
  belong_to :ingredient
end
