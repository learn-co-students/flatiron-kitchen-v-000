class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  validates_presence_of :name

  def recipes_count
    self.recipes.count
  end
end
