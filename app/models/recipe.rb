require 'pry'
class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates_presence_of :name
  validates :name, uniqueness: true

  def ingredients_attributes=(ingredients_attributes)
    # binding.pry
      if ingredients_attributes[:name].present?
        ingredient = Ingredient.find_or_create_by(name: ingredients_attributes[:name])
        if !self.ingredients.include?(ingredient)
          self.recipe_ingredients.build(:ingredient => ingredient)
      end
    end
  end

  def ingredients_attributes
    self.ingredients_attributes
  end

end  #End of Class
