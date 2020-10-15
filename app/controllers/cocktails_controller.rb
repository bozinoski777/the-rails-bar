class CocktailsController < ApplicationController

  def index
    if params[:query].present? && params[:alcoholic].present?
      @pagy, @cocktails = pagy(Cocktail.global_search(params[:query]).where(alcoholic: false))
      loader
    else
      if params[:query].present? && !params[:alcoholic].present?
        @pagy, @cocktails = pagy(Cocktail.global_search(params[:query]))
        loader
      elsif !params[:query].present? && params[:alcoholic].present?
        @pagy, @cocktails = pagy(Cocktail.where(alcoholic: false))
        loader
      else
         @pagy, @cocktails = pagy(Cocktail.all)
         loader

      end
    end
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

  def update
  @cocktail = Cocktail.find(params[:id])
  @cocktail.update(cocktail_params)
  redirect_to cocktail_path(@cocktail)
  end
  def destroy
  @cocktail = Cocktail.find(params[:id])
  @cocktail.destroy
  redirect_to cocktail_path(@cocktail)
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
    params.require(:cocktail).permit(:name, :alcoholic, :ingredients, :doses, :photo, :description, :glass)
  end
end

def loader
  respond_to do |format|
    format.html
    format.json {
    render json: { entries: render_to_string(partial: "render_cocktails", formats: [:html]), pagination: view_context.pagy_nav(@pagy) }
    }
  end
end
