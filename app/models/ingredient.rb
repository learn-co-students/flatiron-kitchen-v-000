class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: :true


  def recipe_ids=(ids)
    ids.delete("")
    self.recipes.clear
    ids.each do |id|
      self.recipes << Recipe.find(id)
    end
  end

  def recipes_attributes=(recipes_attributes)
    recipes_attributes.each do |i, recipe_attributes|
      if recipe_attributes[:name].present?
        self.recipes << Recipe.find_or_create_by(recipe_attributes)
      end
    end
  end
end
