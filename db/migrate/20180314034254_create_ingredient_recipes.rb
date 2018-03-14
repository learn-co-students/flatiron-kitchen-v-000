class CreateIngredientRecipes < ActiveRecord::Migration
  def change
    create_join_table :ingredient, :recipes
  end
end
