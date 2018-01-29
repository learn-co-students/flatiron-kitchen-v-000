class CreateRecipesIngredients < ActiveRecord::Migration
  def change
    create_table :recipes_ingredients do |t|

      t.timestamps null: false
    end
  end
end
