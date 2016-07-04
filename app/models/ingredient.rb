class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, through: :ingredients
  
  validates_presence_of :name
end
