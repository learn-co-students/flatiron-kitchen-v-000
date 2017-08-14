class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  after_initialize :set_quantity, :fill_quantity
  validates :name, presence: true
  serialize :quantity, Hash


  private

  def set_quantity
    self.quantity ||= Hash.new
  end

  def fill_quantity
    self.ingredients.each do |i|
      self.quantity[i.name] = 5
    end
  end
end
