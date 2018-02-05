class Ingredient < ActiveRecord::Base

  validates :name, presence: true

  has_many :recipie_ingredients
  has_many :recipies, :through => :recipie_ingredients
end
