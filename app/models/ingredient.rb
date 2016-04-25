class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, through: :arecipe_ingredients
  validates :name, presence: true
end
