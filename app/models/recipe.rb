class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true
#=begin
  def ingredients=(ingredient_names)
  	self.ingredients.destroy_all
  	ingredient_names.each do |name|
  		if i = Ingredient.find_by(name: name)
  		  self.ingredients << i
  		end
  	end
  end
#=end

end
