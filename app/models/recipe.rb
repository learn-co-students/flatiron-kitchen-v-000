class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

# accepts_nested_attributes_for :recipe_ingredients
# Below, recipe_ingredients_attributes is a hash whose keys are "0", "1", etc (indexed keys), and
# each indexed key points to a hash with 2 key/value pairs of attribute data
# for the quantity and ingredient_id attributes of a single recipe_ingredient instance (i.e. ingredient included in recipe)
# def recipe_ingredients_attributes=(recipe_ingredients_attributes)
#   recipe_ingredients_attributes.each do |i, recipe_ingredient_attributes|
#     self.recipe_ingredients.build(recipe_ingredient_attributes)
#   end
# end

  def num_dishes_preparable
    self.recipe_ingredients.map do |recipe_ingredient|
      if recipe_ingredient.ingredient.total_inventory && recipe_ingredient.ingredient.total_inventory > 0 && recipe_ingredient.quantity && recipe_ingredient.quantity > 0
        recipe_ingredient.ingredient.total_inventory / recipe_ingredient.quantity
      else
        0
      end
    end.min
  end

  def recipe_ingredients_attributes=(recipe_ingredients_attributes)
    recipe_ingredients_attributes.keep_if { |i, recipe_ingredient_attributes| recipe_ingredient_attributes[:ingredient_id].present? }

    self.recipe_ingredients.destroy_all

    recipe_ingredients_attributes.each do |i, recipe_ingredient_attributes|
      self.recipe_ingredients.build(recipe_ingredient_attributes)
    end

    self.save
  end

  def quantity_of(ingredient_instance)
    recipe_ingredient = self.recipe_ingredients.where(ingredient: ingredient_instance).first
    recipe_ingredient.quantity if recipe_ingredient
  end

  def contains_ingredient?(ingredient)
    self.ingredient_ids.include?(ingredient.id)
  end

  def new_or_existing_recipe_ingredient(ingredient_instance)
    self.recipe_ingredients.where(ingredient: ingredient_instance).first_or_initialize
  end

end
# self.recipe_ingredients returns array of ingredient instances that comprise that recipe instance (self)
# #map invokes the block once on each array element and returns an array of values returned by the block
# for each ingredient instance included in the recipe, call #quantity on it
# to return the amount of that ingredient needed in a single dish of the recipe.
# If a particular quantity of that ingredient exists and the quantity needed for the recipe dish is > 0,
# Since a recipe_ingredient instance belongs to an ingredient instance, we can
# call #ingredient on recipe_ingredient instance to return the ingredient instance to which it belongs
# Then we call #total_inventory on the ingredient instance
# to return the total amount of the ingredient available for ALL dishes of all recipes
# and divide this number by the quantity of the ingredient needed in the particular recipe dish
# the return value is therefore an array whose elements are the number of dishes that can be prepared with each ingredient
# then we call #min on this array to return the minimum value, which is the total amount of dishes that can be prepared
#-------
# recipe_ingredients_attributes is an array of hashes, where
# each hash may contain 2 key/value pairs of attribute data for the quantity and ingredient_id attributes a single recipe_ingredient instance to be created (an ingredient found in the recipe)
# Iterate over recipe_ingredients_attributes array. Delete any hash element if that hash has a key of "ingredient_id" pointing to an EMPTY value,
# which means that the user did NOT select the checkbox to include that particular ingredient in the recipe
# Delete any ingredients previously included in recipe and start fresh
# Iterate over recipe_ingredient_attributes hash (which now only contains hashes that have quantity and ingredient_id values - meaning those ingredients were selected for the recipe)
# For each hash, call #recipe_ingredients on recipe instance (self) to return array of recipe_ingredient instances (array of ingredients found in that recipe)
# call #build on the array and pass in each hash to create a new recipe_ingredient instance (with its quantity and ingredient_id attribute values mass assigned)
# to be included in the recipe
# save changes to recipe instance (self) to DB
