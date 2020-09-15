class RatingsController < ApplicationController
  def create
    @rating = Rating.new(cocktail_id: params[:cocktail_id], rating: params[:rating])
    @rating.create
  end
end
