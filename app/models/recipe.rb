class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :name, presence: true

  def ingredient_attributes=(ingredient_attributes)
    if ingredient_attributes[:name].present?
      self.build_ingredient(ingredient_attributes)
    end
  end
end
