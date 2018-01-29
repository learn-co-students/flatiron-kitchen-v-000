class Recipe < ActiveRecord::Base
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients
	validates_presence_of :name

	def dish_quantity
		unless ingredients.empty?
			if ingredients.any? { |ingredient| ingredient == 0 }
				0
			else 
				ingredients.sort { |a,b| a.quantity <=> b.quantity }.first.quantity
			end
		end
	end


end
