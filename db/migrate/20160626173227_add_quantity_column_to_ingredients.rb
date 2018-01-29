class AddQuantityColumnToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :quantity, :integer
  end
end
