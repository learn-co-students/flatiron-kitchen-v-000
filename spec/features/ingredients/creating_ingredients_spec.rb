require 'spec_helper'

describe "creating ingredients" do
  context "on the new ingredient page" do
    before do
      visit new_ingredient_path
    end

    # Is there a form with the given HTML ID?
    it "should have a form to create the ingredients" do
      expect(page).to have_css("form#new_ingredient")
    end

    # After submitting the form out with the given name, does the
    # ingredient exist in the database?
    #
    # Is the user redirected to a page that displays the ingredient name?
    it "should create an ingredient when the form is submitted" do
      fill_in 'ingredient_name', with: 'Parsley'
      fill_in 'ingredient_unit', with: 'tablespoon'
      fill_in 'ingredient_stock', with: 20
      click_button('Create Ingredient')

      expect(Ingredient.first.name).to eq("Parsley")
      expect(page).to have_content("Parsley")

      expect(Ingredient.first.unit).to eq("tablespoon")
      expect(page).to have_content("tablespoons")

      expect(Ingredient.first.stock).to eq(20)
      expect(page).to have_content("20")
    end
  end
end
