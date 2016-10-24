class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: :true, allow_blank: false
  accepts_nested_attributes_for :ingredients

 def ingredient_ids=(ingredient_ids)
    ingredients = Ingredient.where("id in (?)", ingredient_ids)
    self.ingredients = ingredients
  end


  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.values.each do |ingredient_attribute|
      if ingredient_attribute[:name].present?
        ingredient = Ingredient.find_or_create_by(name: ingredient_attribute[:name])
        if !self.ingredients.include?(ingredient)
          self.recipe_ingredients.build(:ingredient => ingredient) #=> Do i need this?
      # self.ingredients << ingredient
        end
      end
    end
  end
end
 