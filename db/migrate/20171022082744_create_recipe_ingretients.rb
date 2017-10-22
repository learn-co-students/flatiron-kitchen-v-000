class CreateRecipeIngretients < ActiveRecord::Migration
  def change
    create_table :recipe_ingretients do |t|
      t.integer :recipe_id
      t.integer :ingredient_id

      t.timestamps null: false
    end
  end
end
