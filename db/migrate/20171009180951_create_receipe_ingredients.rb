class CreateReceipeIngredients < ActiveRecord::Migration
  def change
    create_table :receipe_ingredients do |t|
      t.string :recipe_id
      t.string :ingredient_id

      t.timestamps null: false
    end
  end
end
