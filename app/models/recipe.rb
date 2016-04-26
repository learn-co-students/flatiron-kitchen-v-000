class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates_presence_of :name
  validates_uniqueness_of :name

  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true

  def recipe_ingredients_attributes=(ingredients)
    ingredients.delete_if { |i, ingredient| ingredient[:ingredient_id].to_i == 0 }
    
    self.recipe_ingredients.destroy_all
    ingredients.each { |i, ingredient| self.recipe_ingredients.build(ingredient) } 
    
    self.save
  end

  def find_or_create(ingredient)
    self.recipe_ingredients.where(ingredient: ingredient).first_or_create
  end

  def has_ingredient?(ingredient)
    self.ingredient_ids.include?(ingredient.id)
  end
end