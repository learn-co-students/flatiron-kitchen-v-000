class Ingredient < ActiveRecord::Base
	has_many :recipe_ingredients
	has_many :recipes, through: :recipe_ingredients
	validates :name, presence: true
	 
	def quantity(rec_id, ing_id)
		RecipeIngredient.find_by(recipe_id: rec_id, ingredient_id: ing_id).quantity
	end	
end

# could be def Quanity(rec_id, self.id)
