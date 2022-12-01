class GiftsWishlistsController < ApplicationController
  def create
    @add = GiftsWishlist.new(add_params)
    @add.wishlist_id = params[:wishlist_id]
    @add.save!
    redirect_to wishlist_path(params[:wishlist_id])
    # wishlist

  end

  private

  def add_params
    params.require(:gifts_wishlist).permit(:event_date, :category, :title, :gift_id)
  end
  # params
end
