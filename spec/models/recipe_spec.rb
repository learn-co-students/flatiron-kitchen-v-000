require 'spec_helper'

describe 'Recipe' do
  it 'is invalid with a blank name' do
    recipe1 =  Recipe.new(name: nil)
    recipe2 =  Recipe.new(name: '')

    expect(recipe1).to have(1).errors_on(:name)
    expect(recipe2).to have(1).errors_on(:name)
  end
  
  context "#ingredients_to_dishes" do
    before(:each) do 
      @scrambled_eggs = Recipe.find_or_create_by(name: "Scrambled Eggs") 
      
      @egg = Ingredient.find_or_create_by(name: "Eggs", quantity: 10)
      @butter = Ingredient.find_or_create_by(name: "Butter", quantity: 4)
      
      RecipeIngredient.find_or_create_by(recipe_id: @scrambled_eggs.id, ingredient_id: @egg.id, quantity: 4)
      RecipeIngredient.find_or_create_by(recipe_id: @scrambled_eggs.id, ingredient_id: @butter.id, quantity: 1)
    end
    it "returns the number of dishes that can be made with ingredients on hand" do 
     
      
      expect(@scrambled_eggs.ingredients_to_dishes).to eq(2)
    end
    
    it "doesn't hard code the result of the method" do 
      @egg.quantity = 12
      @egg.save
      expect(@scrambled_eggs.ingredients_to_dishes).to eq(3)
    end
  end
end
