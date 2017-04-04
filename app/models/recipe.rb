require 'pry'
class Recipe < ActiveRecord::Base
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    
    validates_presence_of :name
    accepts_nested_attributes_for :ingredients, reject_if: :all_blank
    
    def ingredient_attributes= (ingredient_attr)
         binding.pry
    end
end
