class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :ingredients, :recipes, table_name: :recipe_ingredients
  end
end
