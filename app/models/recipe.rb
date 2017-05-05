class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :name, presence: true

  def ingredients_attributes=(ingredient_attributes_hashes)
    ingredient_attributes_hashes.each do |index_key, ingredient_attribute|
      ingredient = Ingredient.find_or_create_by(ingredient_attribute)
      if !self.ingredients.include?(ingredient)
        self.recipe_ingredients.build(ingredient_id: ingredient.id)
      end
    end
  end

  def ingredient_ids=(ingredient_ids)
    ingredients = Ingredient.where("id in (?)", ingredient_ids)
    self.ingredients = ingredients

    # self.recipe_ingredients.each do |ri|
    #   binding.pry
    #   ri.delete if !ingredient_ids.include?(ri.ingredient_id)
    # end
  end
end
