class PagesController < ApplicationController
  def home
    @items = Item.all
  end

  def works
  end

end
