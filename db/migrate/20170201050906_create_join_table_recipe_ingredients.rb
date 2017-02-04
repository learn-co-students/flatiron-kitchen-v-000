class CreateJoinTableRecipeIngredients < ActiveRecord::Migration
  def change
    create_join_table :recipes, :ingredients do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
    end
  end
end
