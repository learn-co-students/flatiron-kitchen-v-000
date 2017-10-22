class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.values.each do |ingredient_attributes|
      ingredient = Ingredient.find_or_create_by(ingredient_attributes) if !ingredient_attributes.values.empty?
      self.ingredients << ingredient if !self.ingredients.include?(ingredient)
    end 
  end

end
