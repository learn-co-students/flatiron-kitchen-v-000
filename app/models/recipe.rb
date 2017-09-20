class Recipe < ActiveRecord::Base
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    
    validates :name, presence: true
    accepts_nested_attributes_for :ingredients, reject_if: :reject_ingredients


    def reject_ingredients(attributes)
        attributes['name'].blank?
    end
end
