class Recipe < ActiveRecord::Base
  validates_presence_of :name
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  #accepts_nested_attributes_for :ingredients
end
