class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])



    @dose = Dose.new(dose_params)
    # we need `cocktail_id` to associate dose with corresponding cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end
