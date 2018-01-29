class Recipe < ActiveRecord::Base
  validates :name, presence: true
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients  

  def ingredient_ids=(ingredients)
    self.ingredients = []
    ingredients.delete_if { |ingredient| ingredient == "" }
    ingredients.each do |ingredient|
      self.ingredients << Ingredient.find(ingredient)
    end
  end

end
