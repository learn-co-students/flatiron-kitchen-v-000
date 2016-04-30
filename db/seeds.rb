require 'faker'
8.times do
  Ingredient.create(name: Faker::Lorem.word)
end

4.times do
  Recipe.create(name: Faker::Address.city)
end
