class LendingsController < ApplicationController
  def create
    @lending = Lending.new(lending_params)
    @lending.user = current_user
    @lending.item = Item.find(params[:item_id])

    # Calculates the total price
    @total_time = (@lending.end_date - @lending.start_date).to_i
    @item_price = Item.find(@lending.item_id).price
    @total = @item_price * @total_time
    @lending.total = @total.to_i

    if @lending.save
      redirect_to items_path, notice: "That's $#{@lending.total}"
    else
      redirect_to dashboard_path, notice: "Can't lend this Item"
    end
  end

  # PATCH /offers/:id/accept
  # @TODO authorize that the user should actually be allowed the offer
  def accept
    @lending = Lending.find(params[:id])
    if @lending.accepted!
      redirect_to dashboard_path, notice: 'Lending accepted'
    else
      redirect_to dashboard_path, notice: 'Lending could not be accepted - please try again' 
    end
  end

  # PATCH /offers/:id/reject
  # @TODO authorize that the user should actually be reject the offer
  def decline
    @lending = Lending.find(params[:id])
    if @lending.declined!
      redirect_to dashboard_path, notice: 'Lending declined'
    else
      redirect_to dashboard_path, notice: 'Lending could not be rejected - please try again' 
    end
  end

  private

  def lending_params
    params.require(:lending).permit(:start_date, :end_date)
  end
end
