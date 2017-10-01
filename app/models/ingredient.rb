class Ingredient < ActiveRecord::Base
  has_many :recipes
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: true
end
