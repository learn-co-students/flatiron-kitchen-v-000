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
      fill_in 'ingredient_name', with: 'All-purpose flour'
      click_button('Create Ingredient')

      expect(Ingredient.first.name).to eq("All-purpose flour")
      expect(page).to have_content("All-purpose flour")
    end
  end
end
