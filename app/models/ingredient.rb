class Ingredient < ActiveRecord::Base
  has_many :RecipeIngredients
  has_many :recipes, through: :RecipeIngredients
  validates :name, presence: true


end
