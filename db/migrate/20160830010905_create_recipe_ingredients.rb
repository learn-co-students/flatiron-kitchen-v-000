class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe_id, index: true
      t.references :ingredient_id, index: true

      t.timestamps null: false
    end
    add_foreign_key :recipe_ingredients, :recipe_ids
    add_foreign_key :recipe_ingredients, :ingredient_ids
  end
end
