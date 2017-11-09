class Ingredient < ActiveRecord::Base
  validates :name, presence: true
  validates :unit, presence: true

  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
end
