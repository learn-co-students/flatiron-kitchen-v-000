class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :name, presence: true

  require 'pry'

  def ingredient_ids=(ingredient_ids)
    ingredients = Ingredient.where("id in (?)", ingredient_ids)
    self.ingredients = ingredients
  end

  def ingredients_for_recipe
    self.ingredients
  end
end
