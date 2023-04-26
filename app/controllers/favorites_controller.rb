class FavoritesController < ApplicationController

  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites
  end

  def create
    @favorite = current_user.favorites&.build(favorite_params)

    if @favorite.save
      redirect_to (request.referrer || root_url), notice: "Favorite added successfully"
    else
      redirect_to (request.referrer || root_url), alert: "Unable to add favorite"
    end
  end

  def destroy
    @favorite = current_user.favorites.find(params[:id])

    if @favorite.destroy
      redirect_to favorites_path, notice: "Favorite removed successfully"
    else
      redirect_to favorites_path, alert: "Unable to remove favorite"
    end
  end

  private

  def favorite_params
    params.require(:article).permit(:title, :url, :urlToImage, :description, :content)
  end

  
end
