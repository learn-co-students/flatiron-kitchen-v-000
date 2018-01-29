class Recipe < ActiveRecord::Base
  validates_presence_of :name
  has_many :ingredients

  accepts_nested_attributes_for :ingredients
end
