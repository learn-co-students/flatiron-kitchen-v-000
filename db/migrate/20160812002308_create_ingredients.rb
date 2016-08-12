class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.float :inventory_total
      t.string :inventory_units

      t.timestamps null: false
    end
  end
end
