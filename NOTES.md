Iteration in Recipe Edit Form without using form_for:

<% @ingredients.each do |ingredient| %>
  <div>
    <%= label_tag "ingredient_#{ingredient.id}", ingredient.name %>
    <%= text_field_tag "recipe[recipe_ingredients_attributes][][quantity]", @recipe.quantity_of(ingredient), id: "ingredient_quantity_#{ingredient.id}" %>
    <%= check_box_tag "recipe[recipe_ingredient_attributes][][ingredient_id]", ingredient.id, @recipe.contains_ingredient?(ingredient), id: "ingredient_#{ingredient.id}" %>
  </div>
<% end %>
