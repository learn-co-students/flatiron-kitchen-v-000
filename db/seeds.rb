p=Ingredient.create(name: 'Paprika')
c=Ingredient.create(name: 'Clove')
g=Ingredient.create(name: 'Ginger')
ci=Ingredient.create(name: 'Cider')
s=Ingredient.create(name: 'Spam')
o=Ingredient.create(name: "cooking oil")
r=Ingredient.create(name: "Rice")
e=Ingredient.create(name: "Eggs")
w=Ingredient.create(name: "Red Wine")
sa=Ingredient.create(name: "Salt")

cider = Recipe.create(name: "Winter Cider")
mulled = Recipe.create(name: "Mulled wine")
rice = Recipe.create(name: "Spam Fried Rice")
eggs=Recipe.create(name: "Spicy Scramble")

cider.ingredients << c << g << ci
mulled.ingredients << c << g << ci << w 
rice.ingredients << s << r << o << e << p
eggs.ingredients << e << p << o << s << sa