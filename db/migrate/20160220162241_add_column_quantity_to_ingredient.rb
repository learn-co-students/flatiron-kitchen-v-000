class AddColumnQuantityToIngredient < ActiveRecord::Migration
  def change
  	add_column :ingredients, :quantity, :integer, default: 1
  end
end
