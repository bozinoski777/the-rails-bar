class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.order(name: :asc)
    @cocktails = Cocktail.where(alcoholic: params[:alcoholic])
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @ingredients = Ingredient.all
    @rating = Rating.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end

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

  def cocktail_params
    params.permit(:name, :alcoholic, :ingredients, :doses, :photo)
  end
end
