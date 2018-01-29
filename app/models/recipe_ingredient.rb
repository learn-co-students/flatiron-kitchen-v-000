class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe 
  belongs_to :ingredient
  
  def recipe_name 
    self.recipe.name
  end 
  
  def ingredient_name 
    self.ingredient.name
  end
end
