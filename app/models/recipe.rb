class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank

  #def ingredients_attributes=(ingredients_attributes)

    #ingredients_attributes.values.each do |ingredient_attributes|
      #ingredient = Ingredient.find_or_create_by(ingredient_attributes)
      #self.ingredients << ingredient unless ingredient ==
    #end

  #end

end
