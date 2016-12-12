class Recipe < ActiveRecord::Base
	has_many :ingredients, through: :ingredients_recipes
	has_many :ingredients_recipes
	accepts_nested_attributes_for :ingredients, reject_if: :no_name

	# def ingredients_attributes=(ing)
	# 	ing.each do |ingredient|
	# 		self.ingredients << Ingredient.find_or_create_by(name: ingredient) unless ingredient.empty?
	# 	end
	# end

	# def ingredients_attributes
	# 	self.ingredients
	# end

	def no_name(attributes)
		attributes[:name].blank?
	end
end
