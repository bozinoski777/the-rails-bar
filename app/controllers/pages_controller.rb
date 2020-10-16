class PagesController < ApplicationController
  def home
    @pagy, @cocktails = pagy(Cocktail.joins(:ratings).group('cocktails.id').order('avg(ratings.rating) desc'))
    loader
  end
end

private

def loader
  respond_to do |format|
    format.html
    format.json {
    render json: { entries: render_to_string(partial: "./cocktails/render_cocktails", formats: [:html]), pagination: view_context.pagy_nav(@pagy) }
    }
  end
end
