class Recipe < ActiveRecord::Base

  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_ingredients
  validates_presence_of :name
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank
end
