class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: true
end
