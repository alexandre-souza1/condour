class PlacesController < ApplicationController

  private

  def article_params
    params.require(:article).permit(:name, :price, :description, photos: [])
  end
end
