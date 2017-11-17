class Recipe < ActiveRecord::Base
    has_many :ingredients
    validates :name, presence: true

    def ingredients_attributes=(ingredient_attributes)
        if ingredient_attributes.present?
            ingredient = Ingredient.find_or_create_by(ingredient_attributes)
            if !self.ingredients.include?(ingredient)
                self.ingredients << ingredient
            end
        end
    end
end
