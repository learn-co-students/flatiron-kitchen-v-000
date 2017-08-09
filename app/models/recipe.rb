class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates_presence_of :name

  def recipes_available
    inventory_collection = self.ingredients.collect {|i| (i.inventory / i.quantity).floor}
    @recipe_count = inventory_collection.min
  end

  private

    def recipe_count
      @recipe_count = recipe_count
    end
end
