require 'spec_helper'

describe 'Recipe' do
  context "validations" do
    it 'is invalid with a blank name' do
      recipe1 =  Recipe.new(name: nil)
      recipe2 =  Recipe.new(name: '')

      expect(recipe1).to have(1).errors_on(:name)
      expect(recipe2).to have(1).errors_on(:name)
    end
  end

  context "#calc_dishes" do
    it "correctly calculates ingredients-to-dishes" do
      recipe = Recipe.new
      recipe.ingredients.build(name: 'olives', quantity: 5)
      recipe.ingredients.build(name: 'peppers', quantity: 8)
      recipe.ingredients.build(name: 'cheese', quantity: 3)

      expect(recipe.calc_dishes).to eq(3)
    end

    it "returns 0 if any ingredients have no quantity" do
      recipe = Recipe.new
      recipe.ingredients.build(name: 'olives')
      recipe.ingredients.build(name: 'peppers', quantity: 8)
      recipe.ingredients.build(name: 'cheese', quantity: 3)

      expect(recipe.calc_dishes).to eq(0)
    end
  end
end
