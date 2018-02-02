class Ingredient < ActiveRecord::Base
  has_many :ingredients
  has_many :recipes
end
