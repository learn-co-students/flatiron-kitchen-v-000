class CreateRecipesIngredients < ActiveRecord::Migration
  def change
    create_table :recipes_ingredients do |t|
      t.integer :ingredient_id
      t.integer :recipe_id
    end
  end
end
