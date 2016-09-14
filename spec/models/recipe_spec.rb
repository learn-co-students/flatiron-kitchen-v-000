require 'spec_helper'

describe 'Recipe' do
  it 'is invalid with a blank name' do
    recipe1 =  Recipe.new(name: nil)
    recipe2 =  Recipe.new(name: '')

    expect(recipe1).to have(1).errors_on(:name)
    expect(recipe2).to have(1).errors_on(:name)
  end

  it 'has a ratio of ingredients on hand to needed' do

    recipe3 = Recipe.new(name: "Turnip Soup")
    recipe3.ingredients.build(name: "Turnip", quantity: 5)
    recipe3.ingredients.build(name: "Broth", quantity: 7)
    recipe3.quants.build(name: "Turnip", num: 2)
    recipe3.quants.build(name: "Broth", num: 2)

    expect(recipe3.max_dishes).to eq(2)
  end
end
