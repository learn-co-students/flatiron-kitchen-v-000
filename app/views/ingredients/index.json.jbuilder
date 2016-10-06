json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :Recipes
  json.url ingredient_url(ingredient, format: :json)
end
