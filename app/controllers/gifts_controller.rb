class GiftsController < ApplicationController
  def show
    @gift = Gift.find(params[:id])
  end

  def index
    @gifts = Gift.all
  end
end
