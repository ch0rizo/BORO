class FavoritesController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    current_user.favorite(@item)

    redirect_to items_path
  end

  def destroy
    @item = Item.find(params[:item_id])
    current_user.unfavorite(@item)
    
    redirect_to items_path
  end
end
