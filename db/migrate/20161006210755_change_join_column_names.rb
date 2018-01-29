class ChangeJoinColumnNames < ActiveRecord::Migration
  def change
    remove_column :recipe_ingredients, :recipe_ids, :integer
    remove_column :recipe_ingredients, :ingredient_ids, :integer 
    add_column :recipe_ingredients, :recipe_id, :integer
    add_column :recipe_ingredients, :ingredient_id, :integer
  end
end
