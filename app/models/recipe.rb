class Recipe < ActiveRecord::Base
  validates :name, presence: true

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def ingredients_attributes=(ingredients_hashes)
    ingredients_hashes.each do |i, ingr_attributes|
      if ingr_attributes[:name].present?
        ingredient = Ingredient.find_or_create_by(name: ingr_attributes[:name])
        self.recipe_ingredients.build(ingredient: ingredient)
      end
    end
  end
end
