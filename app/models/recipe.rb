class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.each do |i, ingredient_attributes|
      if !ingredient_attributes[:name].empty?
        self.ingredients << Ingredient.create(ingredient_attributes[:name])
      end
    end
  end

end
