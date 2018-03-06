class Recipe < ActiveRecord::Base
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients
	validates :name, presence: :true
	accepts_nested_attributes_for :recipe_ingredients

	# def ingredients_attributes=(ingredients_attributes)
	# 	self.ingredients.build(ingredients_attributes)
	# end

	def new_or_find_recipe_ingredient(ingredient)
		rec_ing = RecipeIngredient.find_by(recipe_id: self.id, ingredient_id: ingredient.id)
		if rec_ing
			rec_ing
		else
			RecipeIngredient.new
		end 
	end 

	# pass in ingredient, compare current quantity and compare to the amount th recipe needs 

end

