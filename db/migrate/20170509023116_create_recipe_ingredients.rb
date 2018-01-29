class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.belongs_to :recipe, foreign_key: true, null: false
      t.belongs_to :ingredient, foreign_key: true, null: false
      t.timestamps null: false
    end
  end
end
