class RecipeIngredient < ActiveRecord::Base
  belongs_to :ingredient, :recipe
end
