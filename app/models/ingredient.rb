class Ingredient < ActiveRecord::Base
  validates_presence_of :name
  has_many :ingredient_recipes
  has_many :recipes, through: :ingredient_recipes
  
end
