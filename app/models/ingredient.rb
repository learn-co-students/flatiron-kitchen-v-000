class Ingredient < ActiveRecord::Base
  validates :name, presence: true
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  def recipe_ids=(recipes)
    recipes.delete_if { |recipe| recipe == "" }
    recipes.each do |recipe|
      self.recipes << Recipe.find(recipe)
    end
  end
end
