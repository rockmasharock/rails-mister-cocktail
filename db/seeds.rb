# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts 'Cleaning database...'
Cocktail.destroy_all

puts 'Creating restaurants...'
# cocktails_attributes = [
#   {
#     name: 'Margarita'
#   },
#   {
#     name: 'Pina Colada'
#   }
# ]
# Cocktail.create!(cocktails_attributes)
puts 'Finished!'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
json = open(url).read
data = JSON.parse(json)
data["drinks"].each do |cocktails|
  ingredient = cocktails["strIngredient1"]
  Ingredient.create(name: ingredient)
end
# Cocktail.create!(data)

