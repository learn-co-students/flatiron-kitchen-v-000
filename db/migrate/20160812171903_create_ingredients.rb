class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.boolean :in_stock
      t.timestamps null: false
    end
  end
end
