class CreateRecepeIngredients < ActiveRecord::Migration
  def change
    create_table :recepe_ingredients do |t|
      t.references :recipe, index: true
      t.references :ingredient, index: true

      t.timestamps null: false
    end
    add_foreign_key :recepe_ingredients, :recipes
    add_foreign_key :recepe_ingredients, :ingredients
  end
end
