class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :reicpes, through: :recipe_ingredients
  validates :name, presence: :true
end
