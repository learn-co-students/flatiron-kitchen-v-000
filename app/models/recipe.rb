class Recipe < ActiveRecord::Base
  has_many :ingredients_recipes
  has_many :ingredients, :through => :ingredients_recipes
  validates :name, presence: true
end
