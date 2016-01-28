class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def ingredients_attributes=(ingredients)
    ingredients.values.each do |ingredient|
      unless ingredient[:name] == ""
        self.ingredients << Ingredient.find_or_create_by(name: ingredient[:name])
      end
    end
  end
end
