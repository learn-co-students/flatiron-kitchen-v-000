class Recipe < ActiveRecord::Base
  validates :name, presence: true

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :ingredients, reject_if: proc { |attributes| attributes['name'].blank? }
end
