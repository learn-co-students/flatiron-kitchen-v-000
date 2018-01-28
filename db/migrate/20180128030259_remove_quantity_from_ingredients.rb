class RemoveQuantityFromIngredients < ActiveRecord::Migration
  def change
    remove_column :ingredients, :quantity
  end
end
