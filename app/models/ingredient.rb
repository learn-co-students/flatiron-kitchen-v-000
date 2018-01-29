class Ingredient < ActiveRecord::Base

  belongs_to :recipe
  has_many :ingredients_recipes
  has_many :recipes, through: :ingredients_recipes

  validates :name, presence: true

end
