class WishlistsController < ApplicationController
  def show
    @wishlist = Wishlist.find(params[:id])
    @event = Event.where(wishlist_id: @wishlist.id)
  end

  def index
    @wishlists = Wishlist.all
  end
end
