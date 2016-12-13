class Recipe < ActiveRecord::Base
	has_many :ingredients, through: :ingredients_recipes
	has_many :ingredients_recipes
	# accepts_nested_attributes_for :ingredients, reject_if: :no_name

	def ingredients_attributes=(ingredient_ids)
		ingredient_ids.each do |ingredient_id|
			self.ingredients << Ingredient.find_or_initialize_by(id: ingredient_id)
			# unless ingredient.empty?
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
