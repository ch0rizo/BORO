class DashboardsController < ApplicationController
  def show
    @user = current_user
  end

  def updated

  end
end
