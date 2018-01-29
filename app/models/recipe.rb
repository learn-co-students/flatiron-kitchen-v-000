class Recipe < ActiveRecord::Base
  validates :name, presence: true
  has_many :receipe_ingredients
  has_many :ingredients, through: :receipe_ingredients
end
