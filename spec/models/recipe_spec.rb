require 'spec_helper'

describe 'Recipe' do
  it 'is invalid with a blank name' do
    recipe1 =  Recipe.new(name: nil)
    recipe2 =  Recipe.new(name: '')

    expect(recipe1).to have(1).errors_on(:name)
    expect(recipe2).to have(1).errors_on(:name)
  end

  it 'tracks how many ingredients the recipe requires' do 
    Ingredient.create(name: 'oil')
    Ingredient.create(name: 'flour')
    Ingredient.create(name: 'chocolate')

  	recipe1 = Recipe.new(name: 'bloop')
  	recipe1.ingredients << Ingredient.find(1)
  	recipe1.ingredients << Ingredient.find(2)
  	recipe1.ingredients << Ingredient.find(3)
  	recipe1.save

  	expect(recipe1.ingredients.count).to eq(3)
  end

  it 'tracks how many recipes can be made with ingredients on hand' do 
    Ingredient.create(name: 'oil')
    Ingredient.create(name: 'flour')
    Ingredient.create(name: 'chocolate')
    
  	recipe1 = Recipe.new(name: 'bloop')
  	recipe1.ingredients << Ingredient.find(1)
    recipe1.ingredients << Ingredient.find(2)
    recipe1.ingredients << Ingredient.find(3)
  	recipe1.save

  	recipe2 = Recipe.new(name: 'epicer')
  	recipe2.ingredients << Ingredient.find(1)
  	recipe2.save

  	expect(recipe1.ingredients_recipe_count).to eq(2)
  	expect(recipe2.ingredients_recipe_count).to eq(1)
  end
end
