class Recipe < ActiveRecord::Base

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

  # def sort_ingredients(ingredients)
  #   self.ingredients.collect do |ing|
  #     ing.name
  #   end.sort
  # end

end
