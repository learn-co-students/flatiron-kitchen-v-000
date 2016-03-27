class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients 
  has_many :ingredients, through: :recipe_ingredients
   
  def self.search(query)
    self.all.select { |recipe| recipe.name.downcase.match(query.downcase) }
  end
end
