class Recipe < ActiveRecord::Base
  validates :name, presence: true
  has_many :ingredients
  accepts_nested_attributes_for :ingredients
end
