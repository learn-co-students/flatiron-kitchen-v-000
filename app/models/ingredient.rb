class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients 

   validates :name, presence: true, allow_blank: false

  
end
