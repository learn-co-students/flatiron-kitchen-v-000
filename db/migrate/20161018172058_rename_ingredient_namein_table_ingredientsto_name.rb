class RenameIngredientNameinTableIngredientstoName < ActiveRecord::Migration
  def change
  	rename_column :ingredients, :ingredient_name, :name
  end
end
