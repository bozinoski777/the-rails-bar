class PagesController < ApplicationController
  def home
    @pagy, @cocktails = pagy(Cocktail.all)
  end
end
