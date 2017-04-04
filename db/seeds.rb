# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

chicken_parm = Recipe.create(name:"Chicken Parmesan")
chicken_parm.ingredients.create(name:"chicken")
chicken_parm.ingredients.create(name:"garlic")
chicken_parm.ingredients.create(name:"onions")
chicken_parm.ingredients.create(name:"mozzarella cheese")
chicken_parm.ingredients.create(name:"tomatoes")
chicken_parm.ingredients.create(name:"spaghetti")