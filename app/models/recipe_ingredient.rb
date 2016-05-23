class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient


  def id_math
    self.recipe_id + self.ingredient_id
  end

end
