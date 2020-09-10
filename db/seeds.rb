require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a'
cocktail_serialized = open(url).read
cocktails = JSON.parse(cocktail_serialized)

# seed cocktails
cocktails['drinks'].each do |cocktail|
  Cocktail.create!(name: cocktail['strDrink'], description: cocktail['strInstructions'], seed_id: cocktail['idDrink'])
end
ingredient_description_groups = []
# fetch and convert ingredients
i = 1
cocktails['drinks'].each do |cocktail|
  n = 1
  group = {}
  group["idDrink#{i}"] = cocktail["idDrink"]

  15.times do
    unless cocktail["strIngredient#{n}"].nil?
      group[cocktail["strIngredient#{n}"]] = cocktail["strMeasure#{n}"].nil? ? '1 oz' : cocktail["strMeasure#{n}"]
      n += 1
    end
  end
  ingredient_description_groups << group
  i += 1
end

# seed ingredients
ingredient_description_groups.each do |cocktail|
  # cocktail.reject! { |k, _| k.match(/(idDrink\d\d|idDrink\d)/) }
  begin
    cocktail.each do |k, _|
      unless k.match(/(idDrink\d\d|idDrink\d)/)
        p Ingredient.create!(name: k)
      end
    end
  rescue
  end
end
x = 1
Cocktail.all.each do |cocktail|
  ingredient_description_groups.each do |ingredient_description_pair|
  if ingredient_description_pair["idDrink#{x}"] == cocktail.seed_id
    ingredient_description_pair.each do |k, v|
      unless k.match(/(idDrink\d\d|idDrink\d)/)
        Dose.create!(
          cocktail: cocktail,
          description: v,
          ingredient: Ingredient.find_by(name: k))
      end

    end

    x += 1
  end
end
end
Cocktail.all
# seed doses


    # #Seed images
    # file = URI.open(cocktail['strDrinkThumb'])
    # cocktail.photo.attach(io: file, filename: "#{cocktail['strDrink'].gsub(" ", "")}.#{cocktail['strDrinkThumb'][0...-3]}", content_type: 'image/png')
    # p cocktail
