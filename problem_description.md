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

When in the console, if I use "accepts_nested_attributes_for" in my Recipe Model I can do
```bash
	irb(main):001:0> recipe = Recipe.new(name:"great recipe")
	=> #<Recipe id: nil, name: "great recipe", created_at: nil, updated_at: nil>

	irb(main):003:0> ingredient1 = Ingredient.new(name:"ing1")
	=> #<Ingredient id: nil, name: "ing1", created_at: nil, updated_at: nil>

	irb(main):004:0> recipe.ingredient_ids=(["1"])
	  Ingredient Load (0.2ms)  SELECT  "ingredients".* FROM "ingredients" WHERE "ingredients"."id" = ? LIMIT 1  [["id", 1]]
	=> ["1"]

	irb(main):005:0> recipe.ingredients
	=> #<ActiveRecord::Associations::CollectionProxy [#<Ingredient id: 1, name: nil, created_at: nil, updated_at: nil>]>

	irb(main):006:0> recipe.save
	   (0.1ms)  begin transaction
	  SQL (0.4ms)  INSERT INTO "recipes" ("name", "created_at", "updated_at") VALUES (?, ?, ?)  [["name", "great recipe"], ["created_at", "2016-12-13 15:13:21.135901"], ["updated_at", "2016-12-13 15:13:21.135901"]]
	  SQL (0.1ms)  INSERT INTO "ingredients" ("id", "created_at", "updated_at") VALUES (?, ?, ?)  [["id", 1], ["created_at", "2016-12-13 15:13:21.137508"], ["updated_at", "2016-12-13 15:13:21.137508"]]
	  SQL (0.2ms)  INSERT INTO "ingredients_recipes" ("ingredient_id", "recipe_id") VALUES (?, ?)  [["ingredient_id", 1], ["recipe_id", 2]]
	   (0.6ms)  commit transaction
	=> true
```

If I then remove "accepts_nested_attributes" here is what happens
```bash
	irb(main):001:0> recipe = Recipe.new(name:"great recipe")
	=> #<Recipe id: nil, name: "great recipe", created_at: nil, updated_at: nil>

	irb(main):002:0> ingredient1 = Ingredient.new(name:"ing1")
	=> #<Ingredient id: nil, name: "ing1", created_at: nil, updated_at: nil>

	irb(main):003:0> recipe.ingredient_ids=(["1"])
	  Ingredient Load (0.1ms)  SELECT  "ingredients".* FROM "ingredients" WHERE "ingredients"."id" = ? LIMIT 1  [["id", 1]]
	=> ["1"]

	irb(main):004:0> recipe.ingredients
	=> #<ActiveRecord::Associations::CollectionProxy [#<Ingredient id: 1, name: nil, created_at: "2016-12-13 15:13:21", updated_at: "2016-12-13 15:13:21">]>

	irb(main):005:0> recipe.save
	   (0.1ms)  begin transaction
	  SQL (0.4ms)  INSERT INTO "recipes" ("name", "created_at", "updated_at") VALUES (?, ?, ?)  [["name", "great recipe"], ["created_at", "2016-12-13 15:15:31.962388"], ["updated_at", "2016-12-13 15:15:31.962388"]]
	  SQL (0.2ms)  INSERT INTO "ingredients_recipes" ("ingredient_id") VALUES (?)  [["ingredient_id", 1]]
	SQLite3::ConstraintException: NOT NULL constraint failed: ingredients_recipes.recipe_id: INSERT INTO "ingredients_recipes" ("ingredient_id") VALUES (?)
	   (1.9ms)  rollback transaction
	ActiveRecord::StatementInvalid: SQLite3::ConstraintException: NOT NULL constraint failed: ingredients_recipes.recipe_id: INSERT INTO "ingredients_recipes" ("ingredient_id") VALUES (?)
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/sqlite3-1.3.11/lib/sqlite3/statement.rb:108:in `step'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/sqlite3-1.3.11/lib/sqlite3/statement.rb:108:in `block in each'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/sqlite3-1.3.11/lib/sqlite3/statement.rb:107:in `loop'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/sqlite3-1.3.11/lib/sqlite3/statement.rb:107:in `each'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/activerecord-4.2.0/lib/active_record/connection_adapters/sqlite3_adapter.rb:318:in `to_a'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/activerecord-4.2.0/lib/active_record/connection_adapters/sqlite3_adapter.rb:318:in `block in exec_query'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/activerecord-4.2.0/lib/active_record/connection_adapters/abstract_adapter.rb:466:in `block in log'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/activesupport-4.2.0/lib/active_support/notifications/instrumenter.rb:20:in `instrument'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/activerecord-4.2.0/lib/active_record/connection_adapters/abstract_adapter.rb:460:in `log'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/activerecord-4.2.0/lib/active_record/connection_adapters/sqlite3_adapter.rb:297:in `exec_query'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/activerecord-4.2.0/lib/active_record/connection_adapters/abstract/database_statements.rb:76:in `exec_insert'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/activerecord-4.2.0/lib/active_record/connection_adapters/abstract/database_statements.rb:108:in `insert'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/activerecord-4.2.0/lib/active_record/connection_adapters/abstract/query_cache.rb:14:in `insert'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/activerecord-4.2.0/lib/active_record/relation.rb:64:in `insert'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/activerecord-4.2.0/lib/active_record/persistence.rb:521:in `_create_record'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/activerecord-4.2.0/lib/active_record/counter_cache.rb:139:in `_create_record'
	... 59 levels...
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/activerecord-4.2.0/lib/active_record/connection_adapters/abstract/database_statements.rb:213:in `block in transaction'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/activerecord-4.2.0/lib/active_record/connection_adapters/abstract/transaction.rb:188:in `within_new_transaction'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/activerecord-4.2.0/lib/active_record/connection_adapters/abstract/database_statements.rb:213:in `transaction'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/activerecord-4.2.0/lib/active_record/transactions.rb:220:in `transaction'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/activerecord-4.2.0/lib/active_record/transactions.rb:344:in `with_transaction_returning_status'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/activerecord-4.2.0/lib/active_record/transactions.rb:286:in `block in save'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/activerecord-4.2.0/lib/active_record/transactions.rb:301:in `rollback_active_record_state!'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/activerecord-4.2.0/lib/active_record/transactions.rb:285:in `save'
		from (irb):5
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/railties-4.2.0/lib/rails/commands/console.rb:110:in `start'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/railties-4.2.0/lib/rails/commands/console.rb:9:in `start'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/railties-4.2.0/lib/rails/commands/commands_tasks.rb:68:in `console'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/railties-4.2.0/lib/rails/commands/commands_tasks.rb:39:in `run_command!'
		from /Users/brunoboehm/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/railties-4.2.0/lib/rails/commands.rb:17:in `<top (required)>'
		from bin/rails:4:in `require'
		from bin/rails:4:in `<main>'irb(main):006:0> 
```