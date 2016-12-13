In Flatiron Kitchen I'm having the following setup and problem when trying to save a recipe (with nested ingredient attributes).
Reading the lessons and stackoverflow for hours, can't figure out the problem yet.

Here's my schema
```ruby
ActiveRecord::Schema.define(version: 20161212142549) do

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients_recipes", id: false, force: :cascade do |t|
    t.integer "recipe_id",     null: false
    t.integer "ingredient_id", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
```

Extract of my controller
```ruby
class RecipesController < ApplicationController
	...

	def new
		@recipe = Recipe.new
		@ingredients = Ingredient.all
	end

	def create
		@recipe = Recipe.new(recipe_params)
		if @recipe.save!
			redirect_to root_path
		else
			render :new
		end
	end

	...

	private
		def recipe_params
			params.require(:recipe).permit(:name, ingredient_ids: [], ingredients_attributes: [:name])
		end	
end
```

I get my params from this form partial, "willingly“ built using form_tag
```erb
<%= label_tag :"recipe[name]", "Recipe Name" %>
<%= text_field_tag :"recipe[name]", recipe.name %>

<%= label_tag :"recipe[ingredient_ids][]", "Select existing ingredients" %>
<% ingredients.each do |ingredient| %>
	<%= check_box_tag :"recipe[ingredient_ids][]", ingredient.id, !!recipe.ingredients.include?(ingredient) %><%= ingredient.name %>
<% end %>

<%= label_tag :"recipe[ingredients_attributes][][name]", "Create and add another ingredient" %>
<%= text_field_tag :"recipe[ingredients_attributes][][name]" %>

<%= submit_tag "Create Recipe" %>
```

I then work on the `ingredient_ids` in my Recipe model using a custom writer (i'm trying not to use `accepts_nested_attributes_for`)
```ruby
	def ingredient_ids=(ids)
		ids.each do |id|
			self.ingredients << Ingredient.find_or_initialize_by(id: id)
		end
	end
```

When my controller tries to `.save` the `Recipe.new(recipe_params)` a SQL error is thrown:
```bash
  SQL (0.2ms)  INSERT INTO "ingredients_recipes" ("ingredient_id") VALUES (?)  [["ingredient_id", 1]]
SQLite3::ConstraintException: NOT NULL constraint failed: ingredients_recipes.recipe_id: INSERT INTO "ingredients_recipes" ("ingredient_id") VALUES (?)
   (1.9ms)  rollback transaction
ActiveRecord::StatementInvalid: SQLite3::ConstraintException: NOT NULL constraint failed: ingredients_recipes.recipe_id: INSERT INTO "ingredients_recipes" ("ingredient_id") VALUES (?)
```

Like it cannot find the `recipe_id`, and is only able to insert the `ingredient_id` into the join table (that has a null: false option).
When using regular accepts_nested_attributes, it all works fine, but I don't get the difference.