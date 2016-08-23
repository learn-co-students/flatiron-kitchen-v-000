class Recipe < ActiveRecord::Base
  has_many :recepe_ingredients
  has_many :ingredients, through: :recepe_ingredients

  validates :name, presence: true
end
