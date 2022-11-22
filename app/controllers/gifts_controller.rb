class GiftsController < ApplicationController
  def show
    @gift = Gift.find(params[:id])
  end
end
