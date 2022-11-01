class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @user = current_user
    @item.user = @user
    
    if @item.save
      redirect_to items_path, notice: 'Offer was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def item_params
    params.require(:item).permit(:title, :user_id, :description, :deposit, :price, :category, :photos)
  end
end
