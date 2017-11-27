class Ingredient < ActiveRecord::Base
  #has_and_belongs_to_many :recipes
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: true
end
