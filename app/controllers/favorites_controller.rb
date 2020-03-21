class FavoritesController < ApplicationController
  def create
    # @item = Item.find(params[:item_id])
    @favorite = current_user.favorites.create(item_id: params[:item_id])
    # if favorite.save
    redirect_back(fallback_location: root_path)
    # else
    # redirect_to new_item_path(params[:id]) 
  end

  def destroy
    # @item = Item.find(params[:item_id])
    @favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end

end