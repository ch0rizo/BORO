class LendingsController < ApplicationController
  def create
    @lending = Lending.new(lending_params)
    @lending.user = current_user
    @lending.item = Item.find(params[:item_id])

    if @lending.save
      redirect_to items_path, notice: "Request sent..."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private


  def lending_params
    params.require(:lending).permit(:start_date, :end_date)
  end
end
