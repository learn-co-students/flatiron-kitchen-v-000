class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true


  validates :name, presence: true


  def new_or_existing_recipe_ingredient(ingredient)
    rec_ing = RecipeIngredient.find_by(recipe_id: self.id, ingredient_id: ingredient.id)
    if rec_ing
      rec_ing
    else
      RecipeIngredient.new
    end
  end


end
