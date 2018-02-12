notes.md


#898E8C; /*neutral gray pair with gold lime #898E8C and marina #4F84C4


CRUD app 
index page first
_form  next 
show last 

step by step and test as I go 

1. Ingredients for each recipe
  =? recipe.ingredient1
  		recipe.ingredient2, etc, etc. 

 2. Track which ingredients are available
 	-> add quantity? 
 	ingredients[]

	recipe = 
 	{ name =>    ,
 		ingredients: 
 		["apples", "peaches", "berries"]}


 <% if !@ingredients.blank? %>
 	<% end %>
		<%= @ingredients.each do |ingredient| %>

I don't understand when you use @recipes.ingredients.build

<%  raise @ingredients.inspect %>

show page, there isn't one? 
<h2> Recipe with Ingredients </h2>

<%= @recipe.name %>
<br/>
<%= @ingredients.each do |ingredient| %>
	<%= ingredient.name %>
<% end %>


<%= @ingredients.each do |ingredient| %>
	<%= ingredient.name %>
<% end %>



<%= link_to 'Edit', edit_recipe_path %>




solution text for edit


  <p>
    There are enough ingredients to make <%= @recipe.total_makeable %> <%= @recipe.name.pluralize %>
  </p>

  <%= hidden_field_tag "recipe[ingredient_ids][]", nil %>
  <% @all_ingredients.each do |ingredient| %>
    <div>
      <%= label_tag "ingredient_#{ingredient.id}", ingredient.name %>
      <%= text_field_tag "recipe[recipe_ingredient_attrs][][quantity]", @recipe.quantity_for(ingredient), id: "ingredient_quantity_#{ingredient.id}" %> <%= ingredient.inventory_units %>
      <%= check_box_tag "recipe[recipe_ingredient_attrs][][ingredient_id]", ingredient.id, @recipe_ingredient_ids.include?(ingredient.id), id: "ingredient_#{ingredient.id}" %>
    </div>
  <% end %>

  <%= f.submit %>
<% end %>