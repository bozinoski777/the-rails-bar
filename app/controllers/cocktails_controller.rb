class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.order(name: :asc)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @ingredients = Ingredient.all
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
  end

  private

  def cocktail_params
    params.permit(:name, :alcoholic, :ingredients, :doses, :photo)
  end
end
