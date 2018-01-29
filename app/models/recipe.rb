class Recipe < ActiveRecord::Base
  has_many :RecipeIngredients
  has_many :ingredients, through: :RecipeIngredients
  validates :name, presence: true

end
