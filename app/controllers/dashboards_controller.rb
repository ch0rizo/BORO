class DashboardsController < ApplicationController
  def show
    @user = current_user
    # @reviews = current_user.lendings.reviews
  end

  def updated
    
  end
end
