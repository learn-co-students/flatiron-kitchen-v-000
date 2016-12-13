class Recipe < ActiveRecord::Base
	has_many :ingredients, through: :ingredients_recipes
	has_many :ingredients_recipes
	# accepts_nested_attributes_for :ingredients, reject_if: :no_name

	def ingredients_attributes=(ingredients_attributes)
		ingredients_attributes.each do |i, ingredient_attribute|
			self.ingredients << Ingredient.find_or_initialize_by(name: ingredient_attribute) unless ingredient_attribute.nil?
		end
	end

	def ingredients_attributes
		self.ingredients
	end

	def ingredient_ids=(ids)
		ids.each do |id|
			self.ingredients << Ingredient.find_or_initialize_by(id: id)
		end
	end

	# def no_name(attributes)
	# 	attributes[:name].blank?
	# end
end
