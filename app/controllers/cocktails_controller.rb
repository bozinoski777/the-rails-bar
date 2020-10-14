class CocktailsController < ApplicationController

    def index

      if params[:query].present?
        @cocktails = Cocktail.global_search(params[:query])
      elsif params[:search_alcoholic]
        @cocktails = Cocktail.where(alcoholic: params[:search_alcoholic][:alcoholic])
      elsif params[:search_glass]
        @cocktails = Cocktail.where(glass: params[:search_glass][:glass])
      else
        @cocktails = Cocktail.all.limit(5)
      end
    end
  # def index
  #   if params[:query].present?
  #     @cocktails = Cocktail.global_search(params[:query])
  #   else
  #     @cocktails = Cocktail.all
  #   end
  # end

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
