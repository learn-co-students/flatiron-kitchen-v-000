require 'spec_helper'

describe 'Recipe' do
  it 'is invalid with a blank name' do
    recipe1 =  Recipe.new(name: nil)
    recipe2 =  Recipe.new(name: '')

    expect(recipe1).to have(1).errors_on(:name)
    expect(recipe2).to have(1).errors_on(:name)
  end
  
  it 'lists the other recipes with same ingredients' do 
  	recipe1 =  Recipe.create(name: 'Peppered Sqaush')
    recipe2 =  Recipe.create(name: 'Peppered Sqaush Soup')
    ing1 = Ingredient.create(name: 'pepper')
    ing2 = Ingredient.create(name: 'squash')
    ing3 = Ingredient.create(name: 'broth')
    
    recipe1.ingredients = [ing1, ing2]
    recipe2.ingredients = [ing1, ing2, ing3]
    
    expect(recipe1.get_dishes.length).to eq 0
    expect(recipe2.get_dishes.first).to eq recipe1
  end
end
