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
    ingredient_ids.each do |id|
      if id && !self.ingredients.include?(Ingredient.find_by(id: id))
        self.recipe_ingredients.build(ingredient_id: id)
      end
    end
  end
end
