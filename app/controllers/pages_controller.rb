class PagesController < ApplicationController
  def home
    @cocktails = Cocktail.order(name: :asc).limit(5)
  end
end
