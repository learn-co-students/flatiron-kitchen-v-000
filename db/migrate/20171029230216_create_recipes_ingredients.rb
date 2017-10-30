class CreateRecipesIngredients < ActiveRecord::Migration
  def change
    create_table :recipes_ingredients do |t|
      t.integer :recipe_id
      t.integer :ingredients_id

      t.timestamps null: false
    end
  end
end
