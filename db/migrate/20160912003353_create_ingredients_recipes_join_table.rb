class CreateIngredientsRecipesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :ingredients, :recipes
  end
end
