generate resource Recipe name:string

generate resource Ingredient name:string

Recipe 
	has_many :ingredients, through: :recipe_ingredients
	has_many :recipes_ingredients

Ingredient 
	has_many :recipes, through: :recipe_ingredients
	has_many :recipes_ingredients

generate migration create_join_table_recipe_ingredient recipe ingredient

RecipeIngredient 
	belongs_to :recipe 
	belongs_to :ingredient

App: 
- can create/edit ingredients (new and create controller action, new, index, show views)
- can create/edit recipes
	- can list existing ingredients
	- can create a recipe with (add/remove) one checkboxed ingredient
	- can create a recipe with (add/remove) many checkboxed ingredients
	- can create a recipe no ingredient
