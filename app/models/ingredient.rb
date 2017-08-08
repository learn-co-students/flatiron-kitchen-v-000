class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredient_joins
  has_many :recipes, through: :recipe_ingredient_joins
  validates :name, presence: true
end