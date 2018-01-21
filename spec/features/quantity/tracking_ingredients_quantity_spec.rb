require 'spec_helper'

describe 'Ingredient - unit and stock attributes' do
  it 'is invalid without a unit' do
    ingredient1 = Ingredient.new(name: "Sugar", unit: "")
    ingredient2 = Ingredient.new(name: "Flour", unit: nil)

    expect(ingredient1).to have(1).errors_on(:unit)
    expect(ingredient2).to have(1).errors_on(:unit)
  end

  it 'tracks the amount of each unit in stock, and defaults to zero' do
    ingredient1 = Ingredient.new(name: "Choc Chips", unit: "tbsp")
    ingredient2 = Ingredient.new(name: "Green Tea", unit: "cup", stock: "12")

    expect(ingredient1.stock).to equal(0)
    expect(ingredient2.stock).to equal(12)
  end
end

# 1. test for column in recipe_ingredients for quantity of ingredient required for recipe
# 2. add column into ingredients table for unit
# 3. add to Recipe show page "You can make x batches of this recipe with the current amount of ingredients"
# 4. update ingredients add/edit form to include unit
# 5. update recipe add/edit form to include unit and how much of each ingredient/unit needed for recipe
# 6. add column to ingredients table for stock (show how much total of ingredient we have in pantry)
# 7. update ingredients add/edit form to include area for stock/quantity in pantry
# 8. verify that the recipe show page is showing correct ammount of batches that can be made with the amounts of ingredients on hand
