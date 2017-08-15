class RecipeIngredient < ActiveRecord::Base
  belongs_to :reicpe
  belongs_to :ingredient
end
