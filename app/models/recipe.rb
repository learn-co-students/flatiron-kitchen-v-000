class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates_presence_of :name
  accepts_nested_attributes_for :ingredients

    def ingredients_attributes=(ingredients_attributes)
      ingredients_attributes.values.each do |ingredient_attributes|
        unless ingredient_attributes[:name].blank?
          ingredient = Ingredient.find_or_create_by(ingredient_attributes)
          self.ingredients << ingredient
        end
      end
    end
end
