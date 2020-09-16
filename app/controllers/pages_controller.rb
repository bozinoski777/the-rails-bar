class PagesController < ApplicationController
  def home
    @cocktails = Cocktail.order(name: :asc)
  end
end
