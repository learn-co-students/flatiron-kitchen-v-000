

First version recipes#show had: 

	<%= f.label :ingredients, "Ingredients:" %><br />
	<%= f.collection_check_boxes :ingredient_ids, @ingredients, :id, :name  %>
	<br />


changed to do bonus 


	<%= f.label :ingredients, "Add an ingredient:" %>
	<%= f.fields_for :ingredients, @recipe.ingredients.build do |ingredients_attributes| %>
		<%= ingredients_attributes.text_field :name %>
		<% end %>


<h2> Edit recipe </h2>


<%= form_for @recipe do |f| %>


	<%= f.label :name %>
	<%= f.text_field :name %>



	<%= f.label :ingredients%>
	<%= f.fields_for :ingredients, @recipe.ingredients.build do |ingredients_attributes| %>


	<%= f.label :ingredients.name, "Ingredient List:" %>
	<% f.label :ingredients_attributes.values.each do |name| %>
		<ol>
		<li><%= name %> |
		
		<%= link_to 'Delete', ingredient_path(ingredient), method: :delete, data: { confirm: 'Are you sure?' } %></li>
		</ol>
	<% end %>

		<%= f.label :ingredients_attributes.name, "Add an Ingredient" %>
		<%= f.ingredients_attributes.text_field :name %>

		<% end %>



	 <%= link_to 'Delete', recipe_path(recipe), method: :delete, data: { confirm: 'Are you sure?' } %>

	<%= f.label :ingredients, 'Ingredients:' %>
	<br />
	<%= f.collection_check_boxes :ingredient_ids, @ingredients, :id, :name %>
	<br />

		
	<%= f.submit  %>

<% end %>





	

	<h3> Ingredients:</h3>
	
	This will collect ingredients, but won't bind it to the recipe. 
	<%= f.collection_check_boxes :ingredient_ids, @ingredients, :id, :name %>
		<br />
	<h3> add new: </h3>	
		<%= f.label :name %>
		<%= f.text_field :name %>
		<% end %>

		<br />
	<%= f.submit  %>

<% end %>
<br />

<%= link_to "Add new ingredient", new_ingredient_path %>


<input type="text" name="recipe[ingredients_attributes][][name] "

 </fieldset>

in recipes model
def ingredients_attributes=(ingredients_attributes)
	self.ingredients.build(ingredients_attributes)
end

name
quantity 

<%= f.label :ingredients.name %>
	<% f.label :ingredients.name.each do |ingredient| %>
		<ol>
		<li><%= f.ingredient %></li>
		<% end %>
		<%= link_to 'Delete', ingredient_path(ingredient), method: :delete, data: { confirm: 'Are you sure?' } %>
		</ol>




	:ingredients do |ingredient| %>

			<%= ingredient.label :name %>
			<%= ingredient.text_field :name %>

			<br />
			
			<br />
		<%= end %>
	<%= f.label :name %>
	<%= f.text_field :name %>


Center: where thebinding should go: 



<% f.fields_for :ingredients do | ingredients_builder| %>
 <fieldset>
 	ingredients_builder.each do |ingredient|


<%= ingredient.label :ingredients, 'Ingredients:' %>




<h3>Current ingredients: </h3>
WHY WON"T THIS PRINT? Because ingredients are not currently bound to recipe object. 
 
 <% @recipe.ingredients.each do |ingredient| %>
	 <%= ingredient.name %>

	<%= @recipe.ingredients.count %>
 <% end %>


