class ReviewsController < ApplicationController
  before_action :find_list, only: [ :new, :create ]

  def new
    @item = Item.find(params[:item_id])
    @review = Review.new
    @user = current_user
  end

  def create
    @item = Item.find(params[:item_id])
    @review = Review.new(review_params)
    @review.item = @item
    @review.user = current_user
    if @review.save
      redirect_to item_path(@item)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to item_path
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment, :item_id)
  end
end
