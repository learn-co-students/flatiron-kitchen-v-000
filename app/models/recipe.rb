class Recipe < ActiveRecord::Base
	has_many :ingredients, through: :recipe_ingredients
	has_many :recipe_ingredients
	validates :name, presence: true
	
	def ingredient_ids=(ids)
		
		ingredients = Ingredient.where("id in (?)", ids)
		self.ingredients = ingredients	
	
	end
end
