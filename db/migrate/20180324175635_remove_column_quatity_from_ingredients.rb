class RemoveColumnQuatityFromIngredients < ActiveRecord::Migration
  def change
    remove_column :ingredients, :quatity, :string
  end
end
