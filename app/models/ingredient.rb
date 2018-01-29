class Ingredient < ActiveRecord::Base
  has_many :receipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates_presence_of :name
end
