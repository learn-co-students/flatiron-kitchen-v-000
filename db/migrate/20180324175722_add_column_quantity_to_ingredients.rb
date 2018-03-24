class AddColumnQuantityToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :quantity, :string
  end
end
