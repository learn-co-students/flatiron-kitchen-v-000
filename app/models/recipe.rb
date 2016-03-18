class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates_presence_of :name

  accepts_nested_attributes_for :ingredients, reject_if: proc {|attributes| attributes[:name].blank?}

  # Create RecipeIngredients for this recipe based on form's inputs
  def ingredients_attributes=(ingredients_attributes)
    self.recipe_ingredients.destroy_all

    ingredients_attributes = ingredients_attributes.select{|ia| !!ia[:ingredient_id] }

    ingredients_attributes.each do |ingredient_attributes|
      self.recipe_ingredients.build(ingredient_attributes)
    end
  end

  # Returns the quantity for a recipe's ingredient
  def quantity_for(ingredient)
    recipe_ingredient = self.recipe_ingredients.find_by(ingredient: ingredient)
    recipe_ingredient.quantity if recipe_ingredient
  end

  # Returns the number of times the recipe can be made
  def enough_for
    enough_for = []

    # Push the enough_for counts into the enough_for array
    # If there is no inventory, push 0, otherwise push the inventory / quantity needed
    self.ingredients.each do |ingredient|
      if !!ingredient.inventory
        enough_for << 0
      else
        enough_for << ( ingredient.inventory / self.quantity_for(ingredient) )
      end
    end

    # Return the smallest value inside the enough_for array
    # Cannot return larger number if there is not enough of one ingredient
    enough_for.min if enough_for.min
  end

  # Called by Cook button inside recipe's show page. 
  # RecipesController will call this method and update the inventory if there is enough to make the recipe.
  def cook_recipe
    enough_ingredients = []

    # enough_ingredients is an array of trues and falses. 
    # If inventory for an ingredient is higher than the quantity needed to cook it, true, else false.
    self.ingredients.each do |ingredient|
      enough_ingredients << ( ingredient.inventory >= self.quantity_for(ingredient) )
    end

    # If all the ingredients' inventories are enough to cook the recipe, update the inventory counts.
    if enough_ingredients.all?{|status| !!status }
      self.ingredients.each do |ingredient|
        new_inventory = ingredient.inventory - self.quantity_for(ingredient)
        ingredient.update(inventory: new_inventory)
      end
    end
  end

end
