class Ingredient < ActiveRecord::Base
  has_many :ingredient_recipes
  has_many :recipes, through: :ingredient_recipes
  validates :name, presence: true
end
