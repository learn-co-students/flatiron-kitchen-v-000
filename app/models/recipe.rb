class Recipe < ActiveRecord::Base
  validates :name, presence: true

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def ingredient_ids=(ingredient_ids)
    ingredients = Ingredient.where("id in (?)", ingredient_ids)
    self.ingredients = ingredients
  end
  
end
