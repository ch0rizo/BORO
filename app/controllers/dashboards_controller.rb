class DashboardsController < ApplicationController
  def show
    @user = current_user
  end

  def updated
    @user = current_user
    @lending = Lending.find(@user)
    @lending.update(status: 1)
  end
end
