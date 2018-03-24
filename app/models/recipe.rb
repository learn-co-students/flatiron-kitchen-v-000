class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates_presence_of :name
  accepts_nested_attributes_for :ingredients
  
  # def ingredient_attributes=(ingredient)
  #     self.ingredient = Ingredient.find_or_create_by(name: ingredient.name)
  #     self.ingredient.update(ingredient)
  # end
end