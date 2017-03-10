class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true, uniqueness: true

  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.each do |i, ingredient_attribute|
      if ingredient_attribute[:name].present?
        self.ingredients.build(ingredient_attribute)
      end
    end
  end

end
