class Ingredient < ActiveRecord::Base
  validates :name, presence: true
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  accepts_nested_attributes_for :recipes, reject_if: lambda {|attributes| attributes['name'].blank?}
end
