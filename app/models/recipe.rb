class Recipe < ActiveRecord::Base
  has_many :recipes_ingredients
  has_many :ingredients, through: :recipes_ingredients
  validates :name, presence: true

  def ingredients_names=(ingredients_names)
    Ingredient.find_or_create_by(ingredients_names)
  end
end
