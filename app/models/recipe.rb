class Recipe < ActiveRecord::Base
  has_many :ingredient_recipes
  has_many :ingredients, through: :ingredient_recipes


  def ingredient_ids=(ingredient_ids)
    
    end
    
end
