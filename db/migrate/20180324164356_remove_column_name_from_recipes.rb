class RemoveColumnNameFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :name, :string
  end
end
