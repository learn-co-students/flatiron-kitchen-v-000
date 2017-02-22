require 'spec_helper'

describe "counting cookable" do
  context "on the new recipe page" do
    before do
      Ingredient.create(name: 'Bacon')
      Ingredient.create(name: 'Lettuce')
      Ingredient.create(name: 'Tomato')
      Ingredient.create(name: 'Bread')

      visit new_recipe_path

      fill_in 'recipe_name', with: 'BLT'
      check('Bacon')
      check('Lettuce')
      check('Tomato')
      check('Bread')

      click_button('Create Recipe')
    end

    it "should (tautologically) have the ingredients to cook itself" do
      expect(page).to have_content("Number of recipes that can be cooked with those ingredients: 1")
    end

    it "has all ingredients of subsets, but not supersets, of itself" do
      visit new_recipe_path

      fill_in 'recipe_name', with: 'Paleo BLT'
      check('Bacon')
      check('Lettuce')
      check('Tomato')

      click_button('Create Recipe')

      expect(page).to have_content("Number of recipes that can be cooked with those ingredients: 1")

      visit recipe_path(1)

      expect(page).to have_content("Number of recipes that can be cooked with those ingredients: 2")
    end
  end
end
