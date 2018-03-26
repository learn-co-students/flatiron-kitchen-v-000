class AddColumnNameToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :name, :string
  end
end
