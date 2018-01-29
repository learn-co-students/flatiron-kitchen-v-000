class AddRecipeToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :recipe_id, :string
  end
end
