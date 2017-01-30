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




-------



Started PATCH "/recipes/2" for ::1 at 2016-12-14 15:59:32 +0100
Processing by RecipesController#update as HTML
  Parameters: {"utf8"=>"✓", "authenticity_token"=>"mupc+NRvPwt1RM/QvwOjKn4mxAO/8SfQp+hV0jSFfIfqVWkyKthKQB4YvIqkhToNCfgXVgouejtbJS0Vl0aXPg==", "recipe"=>{"name"=>"Chicken Witj Only Mustard edited", "ing_names"=>["Moustard"], "ingredients_attributes"=>[{"name"=>""}]}, "commit"=>"Create Recipe", "id"=>"2"}
  Recipe Load (0.1ms)  SELECT  "recipes".* FROM "recipes" WHERE "recipes"."id" = ? LIMIT 1  [["id", 2]]
   (0.0ms)  begin transaction
  Ingredient Load (0.1ms)  SELECT  "ingredients".* FROM "ingredients" WHERE "ingredients"."name" = ? LIMIT 1  [["name", "Moustard"]]
  Ingredient Exists (0.0ms)  SELECT "ingredients".* FROM "ingredients" INNER JOIN "ingredients_recipes" ON "ingredients"."id" = "ingredients_recipes"."ingredient_id" WHERE "ingredients_recipes"."recipe_id" = ? AND "ingredients"."id" = ?  [["recipe_id", 2], ["id", 1]]
  SQL (0.2ms)  INSERT INTO "ingredients_recipes" ("recipe_id", "ingredient_id") VALUES (?, ?)  [["recipe_id", 2], ["ingredient_id", 1]]
   (0.5ms)  commit transaction
Redirected to http://localhost:3000/recipes/2
Completed 302 Found in 5ms (ActiveRecord: 1.0ms)



