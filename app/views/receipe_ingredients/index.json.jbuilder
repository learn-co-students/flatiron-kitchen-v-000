json.array!(@receipe_ingredients) do |receipe_ingredient|
  json.extract! receipe_ingredient, :id, :recipe_id, :ingredient_id
  json.url receipe_ingredient_url(receipe_ingredient, format: :json)
end
