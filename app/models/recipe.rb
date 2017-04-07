class Recipe < ActiveRecord::Base

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, uniqueness: true 
  validates :name, presence: true 

  # accepts_nested_attributes_for :ingredients,
  #   allow_destroy: true


  def ingredient_ids=(ingredient_ids)
    ingredients = Ingredient.where("id in (?)", ingredient_ids)
    self.ingredients = ingredients
  end  

end
