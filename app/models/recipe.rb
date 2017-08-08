class Recipe < ActiveRecord::Base
  has_many :recipe_ingredient_joins
  has_many :ingredients, through: :recipe_ingredient_joins
  validates :name, presence: true
end