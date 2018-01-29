class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

  def total_recipes
    quantities = self.ingredients.collect do |ingredient|
      if find_quantity(ingredient) != 0 && !find_quantity(ingredient).blank?
        ingredient.stock / find_quantity(ingredient)
      else
        0
      end
    end
    quantities.sort.first
  end

  def recipe_ingredients_attributes=(recipe_ingredients_attr)
    recipe_ingredients_attr.values.each do |recipe_ingredient_attr|
      recipe_ingredient = RecipeIngredient.find_by(id: recipe_ingredient_attr[:id])
      recipe_ingredient.quantity = recipe_ingredient_attr[:quantity] unless recipe_ingredient_attr[:quantity].blank?
      recipe_ingredient.save
    end
  end

  private

  def find_quantity(ingredient)
    RecipeIngredient.find_by(ingredient_id: ingredient.id, recipe_id: self.id).quantity
  end
end
