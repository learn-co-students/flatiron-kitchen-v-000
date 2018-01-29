class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

  def ingredient_ids=(ingredient_ids)
    ingredient_ids.each{|ingredient_id| self.ingredients << Ingredient.find(ingredient_id) if ingredient_id.present?}
  end
end
