require 'spec_helper'

describe "editing ingredients" do
  context "on the edit ingredient page" do
    before do
      @ingredient = Ingredient.create(name: "Salmon Flanks")
      visit edit_ingredient_path(@ingredient)
    end

    # Is there a form with the given id? (check out how it's
    # interpolated below)
    it "should have a form to edit the ingredient" do
      expect(page).to have_css("form#edit_ingredient_#{@ingredient.id}")
    end

    # Does the ingredient name get updated when the form is submitted?
    # Does the user get redirected to a page that displays the
    # ingredient name?
    it "should update an ingredient when the form is submitted" do
      fill_in 'ingredient_name', with: 'All-purpose flour'
      click_button('Update Ingredient')

      expect(Ingredient.first.name).to eq("All-purpose flour")
      expect(page).to have_content("All-purpose flour")
    end
  end
end
