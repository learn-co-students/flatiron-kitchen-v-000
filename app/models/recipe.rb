class Recipe < ActiveRecord::Base
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients
	validates :name, presence: :true
	accepts_nested_attributes_for :ingredients

	# def ingredients_attributes=(ingredients_attributes)
	# 	self.ingredients.build(ingredients_attributes)
	# end
end

