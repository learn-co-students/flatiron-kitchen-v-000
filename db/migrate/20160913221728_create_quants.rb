class CreateQuants < ActiveRecord::Migration
  def change
    create_table :quants do |t|
      t.string :name
      t.integer :num
      t.integer :recipe_id

      t.timestamps null: false
    end
  end
end
