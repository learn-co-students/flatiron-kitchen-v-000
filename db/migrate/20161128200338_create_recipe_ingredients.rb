class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
    	t.recipe_id
    	t.ingredient_id
      t.timestamps null: false
    end
  end
end
