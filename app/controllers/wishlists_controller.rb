class WishlistsController < ApplicationController
  def show
    @wishlist = Wishlist.find(params[:id])
    # @event = Event.where(wishlist_id: @wishlist.id)
    @event = @wishlist.event
  end

  def index
    @wishlists = Wishlist.all
  end

  def edit
    @wishlist = Wishlist.find(params[:id])
  end
end
