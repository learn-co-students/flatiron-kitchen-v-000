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
