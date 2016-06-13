class Ingredient < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :recipe
  has_many :recipe_ingredients
end
