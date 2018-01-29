class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.belongs_to :ingredient, index: true
      t.belongs_to :recipe, index: true

      t.timestamps null: false
    end
    add_foreign_key :recipe_ingredients, :ingredients
    add_foreign_key :recipe_ingredients, :recipes
  end
end
