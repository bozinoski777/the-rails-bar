require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a'
cocktail_serialized = open(url).read
cocktails = JSON.parse(cocktail_serialized)

# seed cocktails
cocktails['drinks'].each do |cocktail|
  Cocktail.create!(name: cocktail['strDrink'], description: cocktail['strInstructions'])
end
ing_desc = {}
ingredients_per_cocktail = []
descriptions_per_coctail = []
# seed ingredients
cocktails['drinks'].each do |cocktail|
  n = 1
  15.times do
    ing_desc.merge!(cocktail["strIngredient#{n}"] => cocktail["strMeasure#{n}"])
  n += 1
end
  # if cocktail["strIngredient#{n}"].nil?
  #   p "Pass"
  # elsif !ingredient_names.include? "#{cocktail["strIngredient#{n}"]}"
  #   Ingredient.create!(name: cocktail["strIngredient#{n}"])
  # end
end

p ing_desc




# seed doses
# Dose.create!(
#   cocktail: Cocktail.find(n),
#   description: cocktail["strMeasure#{n}"],
#   ingredient: Ingredient.find(n))
# # end

    # #Seed images
    # file = URI.open(cocktail['strDrinkThumb'])
    # cocktail.photo.attach(io: file, filename: "#{cocktail['strDrink'].gsub(" ", "")}.#{cocktail['strDrinkThumb'][0...-3]}", content_type: 'image/png')
    # p cocktail
