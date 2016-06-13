class Recipe < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :ingredients
  has_many :recipe_ingredients

  accepts_nested_attributes_for :ingredients, reject_if:  proc { |attributes| attributes['name'].blank? }
end
