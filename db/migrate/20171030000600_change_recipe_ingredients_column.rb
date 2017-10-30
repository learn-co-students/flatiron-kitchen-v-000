class ChangeRecipeIngredientsColumn < ActiveRecord::Migration
  def change
    rename_column :recipe_ingredients, :ingredients_id, :ingredient_id
  end
end
