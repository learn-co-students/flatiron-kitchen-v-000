class CreateJoinTable < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
         t.integer :recipe_id
         t.integer :ingredient_id
               # t.index [:recipe_id, :ingredient_id]
      # t.index [:ingredient_id, :recipe_id]
    end
  end
end
