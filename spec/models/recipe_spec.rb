require 'spec_helper'

describe 'Recipe' do
  it 'is invalid with a blank name' do
    recipe1 =  Recipe.new(name: nil)
    recipe2 =  Recipe.new(name: '')

    expect(recipe1).to have(1).errors_on(:name)
    expect(recipe2).to have(1).errors_on(:name)

  end

  it 'returns the number of dishes' do
    broccoli = Ingredient. new(name: "Broccoli", quantity: 5)
    onion = Ingredient.new(name: "Onion", quantity: 7)
    peppers = Ingredient.new(name: "Bell Pepper", quantity: 3)

    stir_fry = Recipe.create(name: "Stir Fry")
    stir_fry.ingredients << [broccoli, onion, peppers]
    broccoli_soup = Recipe.create(name: "Broccoli Soup")
    broccoli_soup.ingredients << [broccoli, onion]


    expect(stir_fry.dishes).to eq(3)
    expect(broccoli_soup.dishes).to eq(5)
  end
end
