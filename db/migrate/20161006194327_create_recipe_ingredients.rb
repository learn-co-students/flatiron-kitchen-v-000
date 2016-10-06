class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_ids
      t.integer :ingredient_ids
    end
  end
end
