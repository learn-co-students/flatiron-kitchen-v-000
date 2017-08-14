class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  after_initialize :set_stock
  validates :name, presence: true

  private

  def set_stock
    self.stock = 100
  end
end
