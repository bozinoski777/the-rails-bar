class RatingsController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @rating = Rating.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @rating = Rating.new(rating_params)
    @rating.cocktail = @cocktail
    if @rating.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:rating)
  end
end
