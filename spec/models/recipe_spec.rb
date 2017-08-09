require 'spec_helper'

describe 'Recipe' do
  it 'is invalid with a blank name' do
    recipe1 =  Recipe.new(name: nil)
    recipe2 =  Recipe.new(name: '')

    expect(recipe1).to have(1).errors_on(:name)
    expect(recipe2).to have(1).errors_on(:name)
  end

  it 'can count the number of recipes that can be made' do
    blueberry_pancakes = Recipe.new(name: 'Blueberry Pancakes')
    blueberry_pancakes_ingredients = ['All-purpose flour', 'Sugar']
    blueberry_pancakes_ingredients.each do |ingredient|
      blueberry_pancakes.ingredients.build(name: ingredient, quantity: 3, inventory: 8)
    end
    blueberry_pancakes_ingredients = ['Baking powder', 'Baking soda']
    blueberry_pancakes_ingredients.each do |ingredient|
      blueberry_pancakes.ingredients.build(name: ingredient, quantity: 3, inventory: 6)
    end
    expect(blueberry_pancakes.recipes_available).to eq(2)
  end
end
