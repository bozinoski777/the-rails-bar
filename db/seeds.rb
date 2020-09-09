require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a'
cocktail_serialized = open(url).read
cocktails = JSON.parse(cocktail_serialized)

n = 1
cocktails['drinks'].each do |cocktail|
  # seed ingredients
  Cocktail.create!(name: cocktail['strDrink'], description: cocktail['strInstructions'])
  ingredient_names = Ingredient.pluck(:name)
  if ingredient_names.include? cocktail["strIngredient#{n}"]
    Ingredient.create!(name: cocktail["strIngredient#{n}"])
  end
  # seed cocktails
  # seed doses
  Dose.create!(
    cocktail: Cocktail.find(n),
    description: cocktail["strMeasure#{n}"],
    ingredient: Ingredient.find(n))
  n += 1
end

    # #Seed images
    # file = URI.open(cocktail['strDrinkThumb'])
    # cocktail.photo.attach(io: file, filename: "#{cocktail['strDrink'].gsub(" ", "")}.#{cocktail['strDrinkThumb'][0...-3]}", content_type: 'image/png')
    # p cocktail
