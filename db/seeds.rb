require 'json'
require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

url = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a'
cocktail_serialized = open(url).read
cocktails = JSON.parse(cocktail_serialized)

cocktails['drinks'].each do |cocktail|
  # seed ingredients
  p cocktail
  n = 1
  15.times do
    if !Ingredient.pluck(:name).include? cocktail["strIngredient#{n}"]
      Ingredient.create!(name: cocktail["strIngredient#{n}"])

    end
    # seed cocktails
    Cocktail.create!(name: cocktail['strDrink'], description: cocktail['strInstructions'])
    # seed doses
    Dose.create!(
      cocktail: Cocktail.find(n),
      description: cocktail["strMeasure#{n}"],
      ingredient: Ingredient.find(n))
    n += 1
  end
end

    # #Seed images
    # file = URI.open(cocktail['strDrinkThumb'])
    # cocktail.photo.attach(io: file, filename: "#{cocktail['strDrink'].gsub(" ", "")}.#{cocktail['strDrinkThumb'][0...-3]}", content_type: 'image/png')
    # p cocktail
