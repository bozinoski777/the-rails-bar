class PagesController < ApplicationController
  def home
    @cocktails = Cocktail.order(name: :asc).limit(10)
  end
end
