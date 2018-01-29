class Recipe < ActiveRecord::Base
  validates :name, presence: true
  has_many :recipes_ingredients
  has_many :ingredients, through: :recipes_ingredients
  accepts_nested_attributes_for :ingredients, :allow_destroy => true, reject_if: proc {|attributes| attributes['name'].blank?}
  accepts_nested_attributes_for :recipes_ingredients, :allow_destroy => true, reject_if: proc {|attributes| attributes['amt'] == "0"}
end
