class CreateIngredientsRecipes < ActiveRecord::Migration
  def change
    create_table :ingredient_recipes do |t|
      t.integer :ingredient_id
      t.integer :recipe_id
    end
  end
end
