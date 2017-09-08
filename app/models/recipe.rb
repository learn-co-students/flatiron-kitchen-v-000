class Recipe < ActiveRecord::Base
  has_many :ingredient_recipes
  has_many :ingredients, through: :ingredient_recipes

  accepts_nested_attributes_for :ingredients

  def ingredient_ids=(ingredient_ids)
    
    end
    
end
