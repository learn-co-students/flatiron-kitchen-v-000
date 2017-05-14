class Recipe < ActiveRecord::Base

	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients
	validates :name, presence: true, uniqueness: true

	def self.ingredient_calculator(recipe)
		quantities = []
		recipe.ingredients.each do |ingredient|
			quantities << ingredient.quantity
		end
		quantities.sort!
		quantities[0]	
	end
end
