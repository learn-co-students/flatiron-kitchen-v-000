class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true 

  # scans all recipes and matches their ingredient objects vs the ingredient objects of the shown recipe

  def self.recipe_scan(recipe_object, ingredient_objects)
    Recipe.all.select do |recipe|
      (ingredient_objects == recipe.ingredients) unless recipe == recipe_object
    end
  end
end

