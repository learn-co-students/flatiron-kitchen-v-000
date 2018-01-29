# Ingredient Table
# ==============================
# name           - string
# ==============================
class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates_presence_of :name
end
