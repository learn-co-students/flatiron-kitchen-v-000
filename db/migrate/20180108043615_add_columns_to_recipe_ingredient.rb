class AddColumnsToRecipeIngredient < ActiveRecord::Migration
  def change
    create_table :recipe_ingredient do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
    end
  end
end
