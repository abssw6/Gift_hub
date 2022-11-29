class GiftsWishlistsController < ApplicationController
  def create
    @add = GiftsWishlist.new(add_params)
    # wishlist

  end

  private

  def add_params
    params.require(:gifts).permit(:event_date, :category, :title)
  end
  # params
end
