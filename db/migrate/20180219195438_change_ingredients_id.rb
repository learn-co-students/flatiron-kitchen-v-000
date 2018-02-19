class ChangeIngredientsId < ActiveRecord::Migration
  def change
    rename_column :recipe_ingredients, :ingredient_ids, :ingredient_id
  end
end
