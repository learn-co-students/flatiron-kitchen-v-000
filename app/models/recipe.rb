class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients 
  has_many :ingredients, through: :recipe_ingredients
  accepts_nested_attributes_for :recipe_ingredients
   
  def self.search(query)
    self.all.select { |recipe| recipe.name.downcase.match(query.downcase) }
  end
  
  validates :name, presence: true
  
  def ingredients_to_dishes
    # checks the quantity on hand of all the ingredients and returns 
    # the amount of complete dishes that can be completed with 
    # the ingredients on hand. Divides number of available items 
    # by the amount required for the dish and keeps track of the 
    # lowest number, returns the number at the end 
    dishes = 9999999999999
    self.recipe_ingredients.each do |recipe_ingredient| 
      # makes sure the ingredient has a quantity and that it's not 0
      if recipe_ingredient.quantity && recipe_ingredient.quantity != 0
        number_of_dishes_with_ingredient = (recipe_ingredient.ingredient.quantity / recipe_ingredient.quantity).floor
        # keeps track of the lowers number of dishes per ingredient 
        # by comparing this ingredient with the result for the 
        # other ingredients
        if number_of_dishes_with_ingredient < dishes 
          dishes = number_of_dishes_with_ingredient
        end
      end
    end
    if dishes != 9999999999999 
      dishes
    else
      nil
    end
  end
  
  def recipe_ingredients_attributes=(attributes) 
    self.recipe_ingredients.each_with_index do |recipe_ingredient, index|
      if attributes[index.to_s]["quantity"] != recipe_ingredient.quantity 
        recipe_ingredient.quantity = attributes[index.to_s]["quantity"]
      end
    end
  end
end
