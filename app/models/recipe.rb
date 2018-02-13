class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: :true

  def new_recipe_path
  end
end
