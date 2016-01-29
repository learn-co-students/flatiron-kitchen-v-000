class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates_presence_of :name

  def recipe_ingredients_attributes=(recipe_attributes)
    self.recipe_ingredients.clear
    recipe_attributes.values.each do |ingredient_hash|
      self.recipe_ingredients.build(ingredient_hash)
    end
  end

  def number_of_dishes
    arr = []
    self.recipe_ingredients.each do |ingredient|
      unless ingredient.quantity.nil?
        ingredient_quantity = ingredient.quantity
        total = ingredient.ingredient.inventory_total

        if ingredient_quantity <= total
          arr << total / ingredient_quantity
        end
      end
    end
    arr.min
  end
end
