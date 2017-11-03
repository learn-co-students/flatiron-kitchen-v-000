class AddColumnToRecipeIngredient < ActiveRecord::Migration
  def change
    add_column :recipe_ingredients, :recipe_id, :integer
    add_column :recipe_ingredients, :ingredient_id, :integer
  end
end
