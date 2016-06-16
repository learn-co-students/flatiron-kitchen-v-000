class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

  accepts_nested_attributes_for :ingredients

  def ingredient_attributes=(ings)
    binding.pry
    ings.each do |ing|
      self.ingredients << Ingredient.find(ing)
    end
  end
end
