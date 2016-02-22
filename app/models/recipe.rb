class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

  def ingredient_ids=(ids)
    ingredients.clear
    ids.each do |id|
      ingredients << Ingredient.find(id) unless id.empty?
    end
  end
end
