class Recipe < ActiveRecord::Base
	has_many :recipe_ingredients
	has_many :ingredients, :through => :recipe_ingredients
	
	validates_presence_of :name
	
	def ingredients_attributes=(ing_attrs)
		ing_attrs.values.each do |ing_attr|
			#binding.pry
			if !ing_attr[:name].blank?
				ing = Ingredient.find_or_create_by(ing_attr)
				self.ingredients << ing unless self.ingredients.include?(ing)
			end
		end
	end
	
	def get_dishes
		Recipe.all.select do |recipe|
			(recipe.ingredients & self.ingredients) == recipe.ingredients && recipe != self
		end
	end
	
end
