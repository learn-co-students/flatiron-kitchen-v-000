class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :inventory, default: 0

      t.timestamps null: false
    end
  end
end
