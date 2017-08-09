class AddDefaultValueToQuantityAndInventory < ActiveRecord::Migration
  def change
    change_column :ingredients, :quantity, :integer, default: 2
    change_column :ingredients, :inventory, :integer, default: 4
  end
end
