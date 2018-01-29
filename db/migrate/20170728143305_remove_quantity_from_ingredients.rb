class RemoveQuantityFromIngredients < ActiveRecord::Migration
  def change
    remove_column :ingredients, :quantity, :string
  end
end
