class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id, :foreign_key => true
      t.integer :ingredient_id, :foreign_key => true

      t.timestamps null: false
    end
  end
end
