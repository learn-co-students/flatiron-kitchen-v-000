require 'spec_helper'

describe "calculating available ingredients" do |variable|
	context "on the recipe show page" do
		before do
		  @recipe = Recipe.create(name: "Rice Pudding")
		  	
		  @recipe.ingredients << Ingredient.create(name: 'Paprika', quantity: 6)
	      @recipe.ingredients  << Ingredient.create(name: 'Eggs', quantity: 5)
	      @recipe.ingredients << Ingredient.create(name: 'Rice', quantity: 7)
	      @recipe.ingredients << Ingredient.create(name: 'Milk', quantity: 8)  

	      @recipe.save
	    end  

		it "should calculate how many of the recipe can be made" do
		 visit recipe_path(@recipe)

		 expect(page).to have_content("You can cook this recipe 5 times")
		end
	end			  	
end