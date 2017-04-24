class Recipe < ActiveRecord::Base
  validates :name, presence: true
  has_many :ingredient_recipes
  has_many  :ingredients, through: :ingredient_recipes
end
