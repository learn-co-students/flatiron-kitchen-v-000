class CreateIngredientRecipes < ActiveRecord::Migration
  def change
    create_table :ingredient_recipes do |t|
      t.references :recipe, index: true
      t.references :ingredient, index: true

      t.timestamps null: false
    end
    add_foreign_key :ingredient_recipes, :recipes
    add_foreign_key :ingredient_recipes, :ingredients
  end
end
