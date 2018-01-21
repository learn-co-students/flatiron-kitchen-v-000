class UpdateIngredients < ActiveRecord::Migration
  def change
    change_column :ingredients, :stock, :integer, :default => 0
  end
end
