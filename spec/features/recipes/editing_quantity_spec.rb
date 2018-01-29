require 'spec_helper'

describe "editing quantities" do
  context "on the edit quantity page" do
    before do
      @recipe = Recipe.create(name: "Rice Pudding", servings: 6)
      @recipe.ingredients.create(name: 'Paprika')
      @recipe.ingredients.create(name: 'Clove')
      visit add_recipe_path(@recipe)
    end

    it "should update the ingredient quantities when the form is submitted" do
      fill_in 'recipe_recipe_ingredients_attributes_0_quantity', with: "5"
      fill_in 'recipe_recipe_ingredients_attributes_1_quantity', with: "20"
      click_button('Update Recipe')

      expect(RecipeIngredient.find_by(recipe_id: 1, ingredient_id: 1).quantity).to eq(5)
      expect(RecipeIngredient.find_by(recipe_id: 1, ingredient_id: 2).quantity).to eq(20)
      expect(page).to have_content("You have ingredients for 5 full recipes")
    end

    it "should display the correct amount of recipes from ingredients stock" do
      fill_in 'recipe_recipe_ingredients_attributes_0_quantity', with: "5"
      fill_in 'recipe_recipe_ingredients_attributes_1_quantity', with: "5"
      click_button('Update Recipe')

      expect(page).to have_content("You have ingredients for 20 full recipes")
    end
  end
end
