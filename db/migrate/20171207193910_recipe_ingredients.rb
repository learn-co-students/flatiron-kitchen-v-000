class RecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.string :recipe_id 
      t.string :ingredient_id
    end
    add_index :recipe_ingredients, :recipe_id
    add_index :recipe_ingredients, :ingredient_id
  end
end
