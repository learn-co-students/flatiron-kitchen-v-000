require 'spec_helper'

describe "count recipes" do
	context "on the recipe show page" do
    	before do
	    	@lemon = Ingredient.create(name: "lemon", in_stock: true)
			@parsley = Ingredient.create(name: "parsley", in_stock: false)
			@jamie = Ingredient.create(name: "jamie", in_stock: true)
			@teajuice = Ingredient.create(name: "teajuice", in_stock: true)

			@recipe1 = Recipe.create(name: "drink")
			@recipe2 = Recipe.create(name: "smoothie")
			@recipe3 = Recipe.create(name: "i'm so funny")

			@recipe1.ingredients << @teajuice
			@recipe1.ingredients << @lemon

			@recipe2.ingredients << @parsley
			@recipe2.ingredients << @lemon

			@recipe3.ingredients << @jamie
			@recipe3.ingredients << @teajuice

			visit recipe_path(@recipe1)
		end

		it "knows available ingredients" do
			expect(Ingredient.available_ingredients.count).to eq(3)
			expect(Ingredient.available_ingredients.include?(@parsley)).to eq(false)
		end

		it "counts and displays the number of recipes that can be cooked with the ingredients in stock" do
			expect(Ingredient.ingredients_to_dishes).to eq(2)
			expect(page).to have_content("Which means you are able to cook 2 dishes")
		end


    end

end