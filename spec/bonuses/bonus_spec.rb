require 'spec_helper'

describe 'ingredient quantities for recipes' do
  before do
    ingredient_1 = Ingredient.create(name: "love", quantity: "a whole lot")
    ingredient_2 = Ingredient.create(name: "spit", quantity: "hopefully none")
    no_love = Ingredient.create(name: "love")
  end

  context 'models' do

    it 'ingredients has a quantity attribute' do
      expect(ingredient_1.quantity).to eq("a whole lot")
    end

    it 'quantity is a string' do
      expect(ingredient_1.quantity.class).to eq(String)
    end

    it 'quantity defaults as nil' do
      expect(no_love.quantity).to eq(nil)
      expect(no_love).to have(0).errors_on(:quantity)
    end
  end

  context 'new recipe page' do
    it 'has an input field for the quantity string' do
    end

    it 'saves the ingredient with a quantity string' do
    end

    it 'expect page to include quantity string' do
    end
  end

  context 'edit recipe page' do
    it 'has an input field for the quantity string' do
    end

    it 'updates the ingredient with a quantity string' do
    end

    it 'expect page to include quantity string' do
    end
  end

  context 'show recipe page' do
    it 'expect page to include quantity string in correct format' do
    end
  end
end