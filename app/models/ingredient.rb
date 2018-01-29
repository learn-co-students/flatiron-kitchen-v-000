class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  validates_presence_of :name

  def ingredient_ids=(ingredient_ids)
    ingredients = Ingredient.where("id in (?)", ingredient_ids)
    self.ingredients = ingredients
  end
end
