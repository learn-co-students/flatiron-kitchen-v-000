class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at


    end
  end
end
