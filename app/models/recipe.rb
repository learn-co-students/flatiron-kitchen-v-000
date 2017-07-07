class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates_presence_of :name
  accepts_nested_attributes_for :ingredients

  def ingredients_attributes=()
  end

end
