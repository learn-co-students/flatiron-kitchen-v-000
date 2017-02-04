class CreateIngredientRecipes < ActiveRecord::Migration
  def change
    create_table :ingredient_recipes do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
    end
  end
end
