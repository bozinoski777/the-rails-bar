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
all_cockrails = []
all_ids = []
# ingredients_per_cocktail = []
# descriptions_per_coctail = []
# seed ingredients
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
p all_cockrails


# all_ids.each do |id|
#   cocktails['drinks'].each do |cocktail|
#     all_drinks = {drink_id: id}
#     n = 1
#     15.times do
#       all_drinks.merge! all_drinks[cocktail["strIngredient#{n}"]] = cocktail["strMeasure#{n}"]
#       n += 1
#     end
#   end
# end





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
