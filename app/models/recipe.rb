class Recipe < ActiveRecord::Base
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients
	validates :name, presence: true, allow_blank: false

	accepts_nested_attributes_for :ingredients
end
