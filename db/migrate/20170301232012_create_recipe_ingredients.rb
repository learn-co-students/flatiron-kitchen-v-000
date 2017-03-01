class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.string :recipe_id
      t.string :ingredient_id

      t.timestamps null: false
    end
  end
end
