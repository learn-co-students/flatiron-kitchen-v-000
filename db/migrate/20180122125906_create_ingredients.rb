class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :recipe_quantity
      t.integer :total_quantity

      t.timestamps null: false
    end
  end
end
