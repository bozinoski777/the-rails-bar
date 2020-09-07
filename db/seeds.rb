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

cocktails.each do |cocktail|
  #seed ingredients
  n = 1
  p array_cocktails = cocktail['drinks']
  array_cocktails.each do |thingy|
    15.times do
      unless thingy["strIngredient#{n}"].nil?
        ingredient = Ingredient.new(name: thingy["strIngredient#{n}"])
        ingredient.save
        p ingredient
      end
        n += 1

  end
  end
end

    # #seed cocktails
    # cocktail = Cocktail.create!(name: thingy['strDrink'], description: thingy['strInstructions'])
    # #seed doses
    # Dose.create!(
    #   cocktail: Cocktail.find(n),
    #   description: thingy["strMeasure#{n}"],
    #   ingredient: ingredient)
    # #Seed images
    # file = URI.open(thingy['strDrinkThumb'])
    # cocktail.photo.attach(io: file, filename: "#{thingy['strDrink'].gsub(" ", "")}.#{thingy['strDrinkThumb'][0...-3]}", content_type: 'image/png')
    # p cocktail
