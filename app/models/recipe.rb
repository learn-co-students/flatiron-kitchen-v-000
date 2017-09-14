class Recipe < ActiveRecord::Base
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients

	validates :name, presence: true

	def ingredients_count
		self.ingredients.count 
	end

	def ingredients_recipe_count
		recipes_found = []
		recipes_eliminated = []
		self.ingredients.each do |ingredient|
			#find every recipe with this ingredient
			ingredient.recipes.each do |recipe|
				#see if recipe has been found or eliminated
				unless (recipes_found.include? recipe.id) || (recipes_eliminated.include? recipe.id)	
					#see if recipe has an ingredient not included in self.ingredients
					recipeList = recipe.ingredients.pluck(:name)
					origRecipeList = self.ingredients.pluck(:name)

					if recipeList.all?{|innergredient| origRecipeList.include? innergredient}
						recipes_found.push recipe.id
					else
						recipes_eliminated.push recipe.id 
					end
				end
			end
		end

		recipes_found.count
	end
end


