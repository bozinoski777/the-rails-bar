class RatingsController < ApplicationController

  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(cocktail_id: params[:cocktail_id], rating: params[:rating])
    @rating.save!
  end
end
