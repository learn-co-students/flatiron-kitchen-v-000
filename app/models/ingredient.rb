class Ingredient < ActiveRecord::Base
  belongs_to :recipes
  has_many :recipes, through: :recipe_ingredients

  validates_presence_of :name
end
