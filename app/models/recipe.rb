class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  

  def ingredient_ids=(ingredient_ids)
    binding.pry
    self.ingredients.build(ingredient_ids)
  end

  # def ingredients_attributes

  # end
    
end
