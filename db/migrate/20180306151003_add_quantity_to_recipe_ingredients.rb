class AddQuantityToRecipeIngredients < ActiveRecord::Migration
  def change
    add_column :recipe_ingredients, :quantity, :integer
  end
end
