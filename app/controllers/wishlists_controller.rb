class WishlistsController < ApplicationController
  def show
    @wishlist = Wishlist.find(params[:id])
    # @event = Event.where(wishlist_id: @wishlist.id)
    @event = @wishlist.event
    @current_user_commit = Usercommit.create(user_id: current_user.id, wishlist_id: @wishlist.id, event_id: @event.id, gift_id: params[:gift_id])
  end

  def index
    @wishlists = Wishlist.all
  end

  def edit
    @wishlist = Wishlist.find(params[:id])
  end
end
