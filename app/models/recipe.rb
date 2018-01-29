class Recipe < ActiveRecord::Base

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :name, presence: true

  def calc_dishes
    self.ingredients.map {|i| i.quantity.nil? ? 0 : i.quantity}.min
  end

end
