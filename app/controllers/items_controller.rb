class ItemsController < ApplicationController
  def index
    if params[:query].present?
      @items = Item.search_by_title_and_description (params[:query])
    else
    @items = Item.all
    @items_geocoded = @items.geocoded
    @markers = @items_geocoded.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude,
        info_window: render_to_string(partial: "info_window", locals: {item: item}),
        image_url: helpers.asset_url("logo.png")
      }
    end
  end

  # def geocoded_by :lat, :lon do |obj,results|
  #   if geo = results.first
  #     obj.city    = geo.city
  #     obj.zipcode = geo.postal_code
  #     obj.country = geo.country_code
  #   end
  # end

  def show
    @item = Item.find(params[:id])
    @lending = Lending.new
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @user = current_user

    if @user == @item.user
      @item.update(item_params)
      redirect_to item_path(@item), notice: 'Offer was successfully updated.'
    else
      redirect_to item_path(@item), alert: 'Only the owner can edit this item.'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if current_user == @item.user
      @item.destroy
    end

    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :user_id, :description, :deposit, :price, :category, :address, photos: [])
  end
end
