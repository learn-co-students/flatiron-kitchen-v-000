class AddQuantityTypeToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :quantity_type, :string
  end
end
