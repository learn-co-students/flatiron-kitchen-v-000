class AddTotalInventoryToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :total_inventory, :float
  end
end
