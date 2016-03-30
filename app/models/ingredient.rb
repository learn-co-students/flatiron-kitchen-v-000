class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  # has_many :ingredient_quantities, through: :recipe_ingredients, source: :ingredient_quantity

  validates :name, presence: true
end
