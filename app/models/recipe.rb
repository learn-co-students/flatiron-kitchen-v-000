class Recipe < ActiveRecord::Base
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients

	validates :name, presence: true

	def ingredients_count
		self.ingredients.count 
	end

	def ingredients_recipe_count
		recipes = []
		self.ingredients.each do |ingredient|
			ingredient.recipes.each do |recipe|
				next if recipes.include?(recipe.id)
				if recipe.ingredients.all?{|ingred| self.ingredients.any?{|iv| iv == ingred}}
					recipes.push(recipe.id)
				end
			end
		end
		recipes.count
	end
end
