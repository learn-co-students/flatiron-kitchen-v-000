* Recipe1	
	* ingredient1 -> 1
	* ingredient2 -> 2

* Recipe2
	* ingredient1 -> 3
	* ingredient2 -> 3


* Ingredients Available
	* ingredient1 -> 6 
	* ingredient2 -> 8 


Recipe1 - can make min(6,4) 
	* need 1 of ingredient1: avaiable (6) need (1) -> [can make 6/1 = 6]
	* need 2 of ingredient2: avaiable (8) need (2) -> [can make 8/2 = 4]


Recipe2 - can make min(2,2)
	* need 1 of ingredient1: avaiable (6) need (3) -> [can make 6/3 = 2]
	* need 2 of ingredient2: avaiable (8) need (3) -> [can make 8/3 = round(2)]



Models
* Recipe.rb
	* recipe has_many :recipe_ingredients
	* recipe has_many :ingredients, through: :recipe_ingredients

	 validates :name, presence: true

	 accepts_nested_attributes_for :ingredients

* Ingredient.rb
	* ingredient has_many :recipe_ingredients
	* ingredient has_many :recipes, through: :recipe_ingredients

	validates :name, presence: true

* Recipe_ingredient.rb
	recipe_ingredient belongs_to :recipe
  	recipe_ingredient belongs_to :ingredient

##############################################################
Migrations

* recipe table
	* name

	class CreateRecipes < ActiveRecord::Migration
	  def change
	    create_table :recipes do |t|
	      t.string :name      
	      t.timestamps null: false
	    end
	  end
	end
##########

* ingredient table
	* name


class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name      
      t.timestamps null: false
    end
  end
end
##########


* recipe_ingredient table
	* recipe_id
	* ingredient_id

class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.belongs_to :recipe, index: true, foreign_key: true
      t.belongs_to :ingredient, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
##########


##############################################################
Rails Generate

* rails g resource Recipe name:string --no-test-framework
* rails g resource Ingredient name:string --no-test-framework
* rails g model Recipe_Ingredient --no-test-framework


##############################################################
Seeds

apple_pie = Recipe.create({name: "apple pie") -> id1
peach_pie = Recipe.create({name: "peach pie") -> id2

apple = Ingredient.create({name: "apple") -> id1
peach = Ingredient.create({name: "peach") -> id2
crust = Ingredient.create({name: "crust") -> id3

apple_apple = RecipeIngredient.create({recipe_id:1, ingredient_id: 1})
apple_crust = RecipeIngredient.create({recipe_id:1, ingredient_id: 3})
peach_peach = RecipeIngredient.create({recipe_id:2, ingredient_id: 2})
peach_crust = RecipeIngredient.create({recipe_id:2, ingredient_id: 3})



##############################################################

Views
* Recipes
	* new.html.erb

		Create a Recipe
			Recipe Name (text field)
			Ingredients (check box)
				[] apple
				[] peach
				[] crust
		* create and save new recipe to database -> add recipe_id
		* add ingredient_id to recipe_ingredients		 

	* edit.html.erb

		Edit Recipe
			Recipe Name (prepopulate with existing info) (text field)
			Ingredients (prepopulate with checkboxes for existing ones) (check box)
				[x] apple
				[] peach
				[x] crust

			* Update recipe name and save -> udpate name of existing recipe_id
			* uncheck ingredients and save -> remove ingredient_ids from recipe_ingredients
			* add ingredients and save -> add ingredient_ids to recipe_ingredients


* Ingredients
	* new.html.erb

		Create an Ingredient
			Ingredient Name (text field)
			* create and save new ingredient to database
			* go to ingredient show page -> with  name of ingredient
			

	* edit.html.erb

		Edit Ingredient
			Ingredient Name (prepopulate with existing info) (text field)
			
			* Update ingredient name and save
			* go to ingredient show page -> with name of ingredient



##############################################################

* recipe_controller.rb


class RecipesController < ApplicationController
  
  def show

    @recipe = Recipe.find_or_create_by(params[:id])    

  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.create(recipe_params)

    redirect_to recipe
  end

  private

  def post_params
    params.require(:recipe).permit(:name, ingredient_ids:[], ingredient_attributes: [:name])
  end
end


####################

class IngredientssController < ApplicationController

  def index
  	
  	@ingredients = Ingredient.all

  end

  def new 
  	@ingredient = Ingredient.new  	
  end

  def create
        
    @ingredient = Ingredient.create(comment_params)     
    
    redirect_to ingredient_path(@ingredient)
    
  end

  def show

  	@ingredient = Ingredient.find(params[:id])

  end


  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end


  



