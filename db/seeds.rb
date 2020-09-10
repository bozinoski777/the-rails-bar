require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a'
cocktail_serialized = open(url).read
cocktails = JSON.parse(cocktail_serialized)

# seed cocktails
cocktails['drinks'].each do |cocktail|
  Cocktail.create!(name: cocktail['strDrink'], description: cocktail['strInstructions'])
end
all_cockrails = []
# fetch and convert ingredients
i = 1
cocktails['drinks'].each do |cocktail|
  n = 1
  group = {}
  group["idDrink#{i}"] = cocktail["idDrink"]

  15.times do
    unless cocktail["strIngredient#{n}"].nil?
      group[cocktail["strIngredient#{n}"]] = cocktail["strMeasure#{n}"]
      n += 1
    end
  end
  all_cockrails << group
  i += 1
end
# seed ingredients
all_cockrails.each do |cocktail|
  # cocktail.reject! { |k, _| k.match(/(idDrink\d\d|idDrink\d)/) }
  begin
    cocktail.each do |k, _|
      unless k.match(/(idDrink\d\d|idDrink\d)/)
        Ingredient.create!(name: k)
      end
    end
  rescue
  end
end
p Ingredient.all
p all_cockrails
# seed doses
# Dose.create!(
#   cocktail: Cocktail.find(n),
#   description: cocktail["strMeasure#{n}"],
#   ingredient: Ingredient.find(n))


    # #Seed images
    # file = URI.open(cocktail['strDrinkThumb'])
    # cocktail.photo.attach(io: file, filename: "#{cocktail['strDrink'].gsub(" ", "")}.#{cocktail['strDrinkThumb'][0...-3]}", content_type: 'image/png')
    # p cocktail
