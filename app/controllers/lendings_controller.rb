class LendingsController < ApplicationController
  def new
    @lending = Lending.new
  end

  def create; end
end
