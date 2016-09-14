class Recipe < ActiveRecord::Base
  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes
  has_many :quants

  validates :name, presence: true



  def ingredients_quantities=(ingredients_quantities)
    @quantities = {}
    ingredients_quantities.each do |ingredient, quantity|
      qu = self.quants.build(name: ingredient, num: quantity.to_i)
      qu.save
    end
  end

  def ingredients_quantities
    self.quants
  end


  def ingredients_to_dishes
    ing_to_dishes = {}
    self.ingredients_quantities.each do |quant|
      self.ingredients.each do |ingredient|
        if ingredient.name == quant.name
          ing_to_dishes[quant.name] = (ingredient.quantity / quant.num)
        end
      end
    end
    ing_to_dishes
  end

  def max_dishes
    self.ingredients_to_dishes.values.min
  end

end
