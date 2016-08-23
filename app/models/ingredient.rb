class Ingredient < ActiveRecord::Base
  has_many :recepe_ingredients
  has_many :recepes, through: :recepe_ingredients

  validates :name, presence: true
end
