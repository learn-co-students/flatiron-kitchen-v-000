class RecipeIngredient < ActiveRecord::Base
  belongs_to  :ingredient
  belongs_to  :recipe

  def ingredient_name
    self.ingredient.name
  end
end
