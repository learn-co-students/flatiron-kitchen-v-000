class ChangeIngredientsColumn < ActiveRecord::Migration
  def change
    change_table :recipe_ingredients do |t|
      t.rename :ingredients_id, :ingredient_id
    end
  end
end
