class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :recipe_ingredients, :recipe_id_id, :recipe_id
    rename_column :recipe_ingredients, :ingredient_id_id, :ingredient_id
  end
end
