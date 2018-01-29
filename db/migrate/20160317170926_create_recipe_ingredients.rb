class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.integer :quantity, default: 1

      t.timestamps null: false
    end
  end
end
