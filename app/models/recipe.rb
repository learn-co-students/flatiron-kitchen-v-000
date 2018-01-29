class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true
  #def ingredient_ids=(ingredients)
  #  binding.pry
  #end
end
