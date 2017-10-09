class Ingredient < ActiveRecord::Base
  validates :name, presence: true
  has_many :receipe_ingredients
  has_many :recipes, through: :receipe_ingredients
end
