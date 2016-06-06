class CreateJoinTableRecipeIngredients < ActiveRecord::Migration
  def change
    create_join_table :recipes, :ingredients, table_name: :recipe_ingredients do |t|
      # t.index [:recipe_id, :ingredient_id]
      # t.index [:ingredient_id, :recipe_id]
    end
  end
end
