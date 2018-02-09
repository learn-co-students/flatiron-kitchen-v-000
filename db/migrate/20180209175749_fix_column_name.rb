class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :recipe_ingredients, :recipie_id, :recipe_id
  end
end
