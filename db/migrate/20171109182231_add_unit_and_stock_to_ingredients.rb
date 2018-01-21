class AddUnitAndStockToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :unit, :string
    add_column :ingredients, :stock, :integer
  end
end
