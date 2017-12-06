class RecipeIngredient < ActiveRecord::Migration
    def change
      create_table :recipe_ingredients do |r|
        r.integer :recipe_id
        r.integer :ingredient_id
      end
    end
end
