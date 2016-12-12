class Recipe < ActiveRecord::Base
	has_many :ingredients, through: :ingredients_recipes
	has_many :ingredients_recipes

	def ingredients_attributes=(ingredients)
		ingredients.each do |ingredient|
			self.ingredients << Ingredient.find_or_create_by(name: ingredient) 
		end
	end

	def ingredients_attributes
		self.ingredients
	end
end
