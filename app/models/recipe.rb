class Recipe < ActiveRecord::Base
  validates :name, presence: true
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
end
