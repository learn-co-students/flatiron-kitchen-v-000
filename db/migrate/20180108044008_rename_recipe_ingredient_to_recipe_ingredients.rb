class RenameRecipeIngredientToRecipeIngredients < ActiveRecord::Migration
  def change
    rename_table :recipe_ingredient, :recipe_ingredients
  end
end
