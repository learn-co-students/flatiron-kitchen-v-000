class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates_presence_of :name

  def ingredients_attributes=(i, ingredients_attributes)
    ingredients_attributes. each do |ingredient_attribute|
      #Don't create an ingredient if no name is included
      if ingredient_attributes[:name].present?

        ingredient = Ingredient.find_or_create_by(ingredient_attributes)

        if !self.ingredients.include?(recipe)
          self.recipe_ingredients.build(:ingredient => ingredient)
        end
      end
    end
  end
end
