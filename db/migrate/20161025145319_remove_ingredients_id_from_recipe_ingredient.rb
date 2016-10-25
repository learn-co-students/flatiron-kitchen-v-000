class RemoveIngredientsIdFromRecipeIngredient < ActiveRecord::Migration
  def change
    remove_column :recipe_ingredients, :ingredients_id, :integer
  end
end
