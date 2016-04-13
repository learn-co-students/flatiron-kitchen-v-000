class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates_presence_of :name
  accepts_nested_attributes_for :ingredients

  # def ingredient_ids=(ingredient_id)
  #   ingredients = Ingredient.where('id in ?', ingredient_ids)
  #   self.ingredients = ingredients
  # end
end
