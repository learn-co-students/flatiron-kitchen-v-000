# Recipe Table
# ==============================
# name           - string
# ==============================
class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates_presence_of :name

  def total_makeable
    recipe_ingredients.map do |recipe_ingredient|
      if recipe_ingredient.quantity && recipe_ingredient.quantity > 0
        recipe_ingredient.ingredient.inventory_total / recipe_ingredient.quantity
      else
        0
      end
    end.min
  end

  def recipe_ingredient_attrs=(ri_attrs)
    ri_attrs.keep_if { |ria| ria[:ingredient_id].present? }

    recipe_ingredients.destroy_all
    ri_attrs.each do |attrs|
      recipe_ingredients.build(attrs)
    end

    save
  end

  def quantity_for(ingredient)
    ri = recipe_ingredients.where(ingredient: ingredient).first
    ri.quantity if ri
  end
end
