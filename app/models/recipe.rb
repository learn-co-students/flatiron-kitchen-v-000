class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :ingredients
  

  # def ingredient_ids=(ingredient_ids)
  #   self.ingredients.build(ingredient_ids)
  # end


    
end
