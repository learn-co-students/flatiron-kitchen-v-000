class Ingredient < ActiveRecord::Base
  validates :name, presence: true
  has_many :recipes_ingredients
  has_many :recipes, through: :recipes_ingredients
end
