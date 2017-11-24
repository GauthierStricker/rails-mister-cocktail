require "open-uri"
require "json"

Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all

  def seed_ingredients
   url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
    response = open(url).read
    answer_hash = JSON.parse(response)
    answer_hash.values.first.each do |ingredient_hash|
      Ingredient.create(name: ingredient_hash.values[0])
    end
  end

# def seed_doses
#    Dose.create(description: "6cl")
#    Dose.create(description: "3cl")
# end

# def seed_cocktails
#    Cocktail.create(name: "Mojito")
# end

# seed_cocktails
# seed_doses
seed_ingredients


