class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :name, presence: true
  accepts_nested_attributes_for :ingredients


  def recipe_count
    @count = nil
    totals = []
    self.ingredients.each do |ingredient|
      if ingredient.total_quantity > ingredient.recipe_quantity
        totals << ingredient.total_quantity/ingredient.recipe_quantity
      end
    end
    if totals.min < 0
      @count = 0
    else
      @count = totals.min
    end




  end
end
