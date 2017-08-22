class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :inventory_units
      t.float :inventory_total
      
      t.timestamps null: false
    end
  end
end
