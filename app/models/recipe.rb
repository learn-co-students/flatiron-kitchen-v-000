class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

  def ingredients_attributes=(ingredients_hashes)
    ingredients_hashes.each do |i, ingredient_attributes|
      if ingredient_attributes.present?
        ingredient = Ingredient.find_or_create_by(name: ingredient_attributes[:name])
        self.recipe_ingredients.build(ingredient: ingredient)
      end
    end
  end
end
