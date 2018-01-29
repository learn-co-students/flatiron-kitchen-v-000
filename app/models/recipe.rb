class Recipe < ActiveRecord::Base
  validates :name, presence: true

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def ingredients_ids=(ingredients)
    self.ingredients = []
    ingredients.each do |i|
      if !i.blank?
        ingredient = Ingredient.find(i)
        self.ingredients << ingredient
      end
    end
  end

  def ingredients_ids
    ids = []
    self.ingredients.each do |ingredient|
      ids<< ingredient.id
    end
    ids
  end

end
