class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  validates :name, presence: true
  validates :name, uniqueness: true
end
