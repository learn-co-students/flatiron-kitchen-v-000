class RecipeIngredient < ActiveRecord::Base
    belongs_to :recipie
    belongs_to :ingredient
end
