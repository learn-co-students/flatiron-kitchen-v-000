class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.timestamps null: false
    end
  end
end
