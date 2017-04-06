class Recipe < ActiveRecord::Base
  has_many :ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates_presence_of :name
end
